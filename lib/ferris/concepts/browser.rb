require 'watir'
module Ferris
  module Browser
    class << self
      SWITCH_MAP = { headless:          '--headless',
                     cpu_only:          '--disable-gpu',
                     profile:           'user-data-dir=****',
                     size:              '--window-size=****',
                     user_agent:        '--user-agent=****',
                     ignore_ssl_errors: '--ignore-certificate-errors' }.freeze

      PREF_MAP   = { geolocation: :managed_default_content_settings,
                     password_manager: :password_manager_enabled }.freeze

      CAPS_MAP = { browser: :browser_name,
                   version: :version,
                   os:      :platform,
                   name:    :name }.freeze

      def local(**args)
        vendor = args.fetch(:browser, :chrome).to_sym
        Watir::Browser.new(vendor, switches: map_switches(args), prefs: map_prefs(args))
      end

      def remote(**args)
        hub = args.fetch(:hub, 'http://localhost:4444/wd/hub')
        Watir::Browser.new(:remote, url: hub, desired_capabilities: map_caps(args))
      end

      private

      def map_caps(args)
        caps = Selenium::WebDriver::Remote::Capabilities.new
        args.each { |k, v| caps[CAPS_MAP[k]] = v if CAPS_MAP.include?(k) }
        caps
      end

      def map_switches(args)
        s = []
        args.each do |k, v|
          s.push(SWITCH_MAP[k].gsub('****', v.to_s)) if SWITCH_MAP.include?(k) && v
        end
        s
      end

      def map_prefs(args)
        p = { profile: { managed_default_content_settings: {} } }
        args.each do |k, v|
          next unless PREF_MAP.include?(k)
          case k
          when :geolocation
            p[:profile][:managed_default_content_settings][:geolocation] = v.to_i
          else
            p[:profile][PREF_MAP[k]] = v
          end
        end
      end
    end
  end
end
