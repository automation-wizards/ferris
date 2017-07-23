module Ferris
  module Browser
    class << self
      
      attr_accessor :default

      SWITCH_MAP = { remote_ip:         '--remote-debugging-address=****',
                     remote_port:       '--remote-debugging-port=****',
                     headless:          '--headless',
                     logs:              '--log-path=****',
                     screenshot:        '--screenshot',
                     no_sandbox:        '--no-sandbox',
                     cpu_only:          '--disable-gpu',
                     no_sandbox:        '--no-sandbox',
                     profile:           'user-data-dir=****',
                     size:              '--window-size=****',
                     user_agent:        '--user-agent=****',
                     ignore_ssl_errors: '--ignore-certificate-errors',
                     allow_insecure:    '--allow-running-insecure-content' }.freeze

      PREF_MAP   = { geolocation: :managed_default_content_settings,
                     password_manager: :password_manager_enabled }.freeze

      CAPS_MAP = { browser: :browser_name,
                   version: :version,
                   os:      :platform,
                   name:    :name }.freeze

      ALLOWED_TYPES = %i[local remote]


      def drivers
        @drivers ||= Hash.new
      end

      def define(name, type, **args)
        raise 'unsupported type' unless ALLOWED_TYPES.include? type
        args[:type] = type.to_sym
        drivers[name.to_sym] = args
      end

      def start(args)
        requested = determine_driver(args[:driver]).merge(args)
        case requested[:type]
        when :local  then local(requested)
        when :remote then remote(requested)
        else raise 'not a valid driver type'
        end
      end

      private

      def determine_driver(requested)
        drivers.fetch(requested.nil? ? default : requested)
      end

      def local(**args)
        Watir::Browser.new(:chrome, options: Selenium::WebDriver::Chrome::Options.new(args: map_switches(args), prefs: map_prefs(args)))
      end

      def remote(**args)
        Watir::Browser.new(:remote, url: args.fetch(:hub, 'http://localhost:4444/wd/hub'), desired_capabilities: map_caps(args))
      end

      def map_caps(args)
        caps = Selenium::WebDriver::Remote::Capabilities.new
        args.each { |k, v| caps[CAPS_MAP[k]] = v if CAPS_MAP.include?(k) }
        caps
      end

      def map_switches(args)
        switch_arr = []
        args.each do |k, v|
          switch_arr.push(SWITCH_MAP[k].gsub('****', v.to_s)) if SWITCH_MAP.include?(k) && v
        end
        switch_arr
      end

      def map_prefs(args)
        pref_hash = { profile: { managed_default_content_settings: {} } }
        args.each do |k, v|
          next unless PREF_MAP.include?(k)
          case k
          when :geolocation
            pref_hash[:profile][:managed_default_content_settings][:geolocation] = v.to_i
          else
            pref_hash[:profile][PREF_MAP[k]] = v
          end
        end
        pref_hash
      end
    end
  end
end
