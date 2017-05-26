module Ferris
  class Site
    attr_reader :url, :browser

    include Ferris::Concepts::FormFilling

    extend Ferris::Concepts::Elements
    extend Ferris::Concepts::Pages
    extend Ferris::Concepts::Regions

    def initialize(browser:, url:)
      @url = url
      @browser = browser
    end

    def site
      self
    end

    def visit
      browser.goto url
      ensure_loaded if respond_to?(:ensure_loaded)
      self
    end
  end
end
