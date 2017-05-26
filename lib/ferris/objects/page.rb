module Ferris
  class Page
    attr_reader :url, :browser, :site

    include Ferris::Concepts::FormFilling

    extend Ferris::Concepts::Regions
    extend Ferris::Concepts::Elements
    extend Ferris::Concepts::PageAttributes

    def initialize(site:)
      @site = site
      @browser = site.browser
      @url = site.url + partial_url
    end

    def visit
      browser.goto url
      site.ensure_loaded if site.respond_to?(:ensure_loaded)
      ensure_loaded if respond_to?(:ensure_loaded)
      self
    end
  end
end
