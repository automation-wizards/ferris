module Ferris
  class Page
    attr_reader :url

    include Ferris::Concepts::FormFilling

    extend Ferris::Concepts::Hooks
    extend Ferris::Concepts::Regions
    extend Ferris::Concepts::Elements
    extend Ferris::Concepts::PageAttributes

    def initialize(site:)
      @site = site
      @url = site.url + partial_url
      site.after_initialize if site.respond_to?(:after_initialize)
      after_initialize if respond_to?(:after_initialize)
    end

    def site
      @site
    end
    alias s site

    def browser
      site.browser
    end
    alias b browser

    def visit
      b.goto @url
      site.after_visit if site.respond_to?(:after_visit)
      after_visit if respond_to?(:after_visit)
      self
    end
  end
end
