module Ferris
  class Page
    attr_reader :url

    include Ferris::Concepts::FormFilling

    extend Ferris::Concepts::Regions
    extend Ferris::Concepts::Elements
    extend Ferris::Concepts::PageAttributes

    def initialize(site:)
      @site = site
      @url = site.url + partial_url
      initializer
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
      site.after_visit
      after_visit
      self
    end

    def initializer; end
    def after_visit; end  
  end
end
