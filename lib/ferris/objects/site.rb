
module Ferris
  class Site
    attr_reader :url, :args

    extend Ferris::Concepts::Hooks
    extend Ferris::Concepts::Pages
    extend Ferris::Concepts::Regions

    def initialize(type, **args)
      @browser = Ferris::Browser.send(type, args)
      @url = args[:url]
      @args = args
      after_initialize if respond_to?(:after_initialize)
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
      after_visit if respond_to?(:after_visit)
      self
    end

    def close
      browser.quit
    end

    def clear_cookies
      browser.cookies.clear
    end
  end
end
