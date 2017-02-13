module Ferris
  module Browser
    class << self
      attr_accessor :browser
    end

    def browser
      Browser.browser
    end
  end

  module Region
    def base_url(url = nil)
      @base_url ||= url
    end

    def region(name, class_name, &blk)
      define_method("#{name}_region_object") do
        class_name.base_url = self.class.base_url
        class_name.new.tap do |region|
          if block_given?
            root = self.instance_exec(&blk)
            return root.map {|root| class_name.new.tap {|region| region.root = root} } if root.respond_to?(:to_a)
            region.root = root
          end
        end
      end
      self.instance_eval { private "#{name}_region_object" }

      define_method("#{name}!") { self.class.region_list["@_#{name}"] ||= send("#{name}_region_object") }
      define_method(name)  { self.class.region_list["@_#{name}"] = send("#{name}_region_object") }

      # TODO: Convert to .present? use
      define_method("#{name}_present?") { [send(name)].flatten.map(&:root).map(&:present?).all? }
    end
    alias_method :page, :region

    def region_list
      @regions ||= {}
    end
  end

  class Core
    extend Region
    include Watir::Waitable

    attr_reader   :browser, :base_url
    attr_accessor :root

    def initialize(browser = Browser.browser)
      @browser = browser
      @base_url = self.class.base_url || ''
    end

    def inspect
      '#<%s url=%s title=%s>' % [self.class, url.inspect, title.inspect]
    end
    alias selector_string inspect

    def present?
      raise 'No root element set.' unless root
      root.present?
    end

    def visit(*args)
      browser.goto page_url(*args)
      exception = Selenium::WebDriver::Error::WebDriverError
      message = "Expected to be on #{self.class}, but conditions not met"
      raise exception, message if verifiable? && !loaded?
      self
    end

    def verifiable?
      self.class.require_url || self.respond_to?(:page_title) || self.class.required_element_list.any?
    end

    def loaded?
      raise Selenium::WebDriver::Error::WebDriverError, 'Cannot verify a page/region without requirements' unless verifiable?
      [!self.class.require_url || check_url, !respond_to?(:page_title) || check_title, !self.class.required_element_list.any? || check_required_elements].all?
    end

    def check_url
      browser.wait_until { |browser| page_url[%r{^#{URI.parse(page_url).scheme}://(.*?)/?$}, 1] == browser.url[%r{^#{URI.parse(browser.url).scheme}://(.*?)/?$}, 1] }
    end

    def check_title
      browser.wait_until { |browser| browser.title == page_title }
    rescue Watir::Wait::TimeoutError
      false
    end

    def check_required_elements
      browser.wait_until { |_b| self.class.required_element_list.all? { |e| send(e).present? } }
    rescue Watir::Wait::TimeoutError
      false
    end

    class << self
      attr_writer   :required_element_list
      attr_reader   :require_url
      attr_accessor :base_url

      def page_url(required: false)
        @require_url = required
        define_method('page_url') {|*args| base_url + yield(*args) }
      end
      alias_method :partial_url, :page_url

      def page_title
        define_method('page_title') {|*args| yield(*args) }
      end

      def required_element_list
        @required_element_list ||= []
      end

      def inherited(subclass)
        subclass.required_element_list = required_element_list.dup
      end

      def element(name, required: false, &block)
        define_method(name) {|*args| self.instance_exec(*args, &block) }
        required_element_list << name.to_sym if required
      end
    end
  end

  module SiteObject
    def self.configure(&blk)
      raise 'Must provide block with defined regions' unless block_given?
      last_defined_class = defined_classes.last
      last_defined_class.include Browser
      last_defined_class.extend Region
      last_defined_class.instance_exec(&blk)
    end

    def self.defined_classes
      self.constants.select {|k| self.const_get(k).is_a? Class }.map {|class_name| Object.const_get("#{self.to_s}::#{class_name.to_s}") }
    end

    def self.included(_kls)
      @@defined_classes = defined_classes
    end

    def method_missing(name, *arg, &blk)
      @@defined_classes.each {|class_name| return class_name.new.send(name, *arg, &blk)  if class_name.new.respond_to?(name) }
      super
    end

    def respond_to_missing?(method_name, _include_private = false)
      @@defined_classes.each {|class_name| return true if class_name.new.respond_to?(method_name)}
      super
    end
  end
end
