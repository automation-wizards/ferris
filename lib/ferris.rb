require 'watir'

require_relative 'ferris/actions/form_filling'
require_relative 'ferris/actions/element_setting'

require_relative 'ferris/concepts/elements'
require_relative 'ferris/concepts/page_attributes'
require_relative 'ferris/concepts/pages'
require_relative 'ferris/concepts/regions'
require_relative 'ferris/concepts/browser'

require_relative 'ferris/objects/site'
require_relative 'ferris/objects/page'
require_relative 'ferris/objects/region'

module Ferris
  class << self
    REQUIRED_KEYWORDS  = %i[name type].freeze
    ##
    # Returns a has of all user defined drivers.
    #
    def drivers
      @drivers ||= Hash.new
    end

    ##
    # Define a custom driver.
    #
    # Example:
    # Ferris.define_driver(name: :local_chrome, type: local, browser: :chrome, headless: true, geolocation: 2)
    #
    # You can configure the driver any way you wish, but the block
    # must return a new Watir::Browser instance.
    #
    def define(**args)
      raise 'missing args' unless args.include? REQUIRED_KEYWORDS  
      name = args.delete(:name) { raise 'You must provide a name for your driver'}
      drivers[name] = args
    end
  end
end


