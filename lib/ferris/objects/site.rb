module Ferris
  class Site
    attr_reader :url, :browser

    include Ferris::Concepts::FormFilling

    extend Ferris::Concepts::Elements
    extend Ferris::Concepts::Pages
    extend Ferris::Concepts::Regions

    def initialize(url:)
      raise(Ferris::Exception::MissingBrowser) unless Ferris.browser
      @url = url
      @browser = Ferris.browser
    end

    def site
      self
    env

    def visit
      browser.goto url
      ensure_loaded if respond_to?(:ensure_loaded)
      self
    end
  end
end
