
module Ferris
  class Site
    attr_reader :url, :args

    extend Ferris::Concepts::Pages
    extend Ferris::Concepts::Regions

    def initialize(**args)
      @browser = Ferris::Browser.start(args)
      raise 'Driver was not a Watir Browser' if browser.class != Watir::Browser
      @url = args[:url]
      @args = args
      initializer if respond_to?(:initializer)
      visit
    end

    def site 
      self
    end
    alias s site
    
    def browser 
      @browser 
    end
    alias b browser

    def visit
      browser.goto @url
      after_visit
      self
    end

    def after_visit; end
    
    def close
      browser.quit
    end

    def clear_cookies
      browser.cookies.clear
    end
  end
end
