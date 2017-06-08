module Ferris
  class Region

    include Ferris::Concepts::FormFilling

    extend Forwardable
    extend Ferris::Concepts::Hooks
    extend Ferris::Concepts::Regions
    extend Ferris::Concepts::Elements

    def_delegators :root, :exists?, :present?

    def initialize(root:, site:)
      @root = root
      @site = site
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

    def root
      @root
    end
    alias r root
    
  end
end
