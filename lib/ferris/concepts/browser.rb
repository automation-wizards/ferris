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

      BROWSER_MAP = { chrome:    { local: :chrome,    remote: 'Chrome',    options: 'Chrome' },
                      firefox:   { local: :firefox,   remote: 'Firefox',   options: 'Firefox' },
                      safari:    { local: :safari,    remote: 'Safari',    options: 'Safari' },
                      ie:        { local: :ie,        remote: 'IE',        options: 'IE' },
                      phantomjs: { local: :phantomjs, remote: 'PhantomJS', options: 'PhantomJS' } }.freeze

      def local(**args)
        browser = verify_vendor(args)
        options = Kernel.const_get("Selenium::WebDriver::#{browser[:options]}::Options").new
        map_switches(args, options)
        map_prefs(args, options)
        Watir::Browser.new(browser[:local], options: options)
      end

      def remote(**args)
        hub = args.fetch(:hub, 'http://localhost:4444/wd/hub')
        Watir::Browser.new(:remote, url: hub, desired_capabilities: map_caps(args))
      end

      private

      def verify_vendor(args)
        BROWSER_MAP[args.fetch(:browser, :chrome)]
      end
      

      def map_caps(args)
        caps = Selenium::WebDriver::Remote::Capabilities.new
        args.each { |k, v| caps[CAPS_MAP[k]] = v if CAPS_MAP.include?(k) }
        caps
      end

      def map_switches(args, options)
        args.each do |k, v|
          options.add_argument(SWITCH_MAP[k].gsub('****', v.to_s)) if SWITCH_MAP.include?(k) && v
        end
      end

      def map_prefs(args, options)
        p = { managed_default_content_settings: {} }
        args.each do |k, v|
          next unless PREF_MAP.include?(k)
          case k
          when :geolocation
            p[:managed_default_content_settings][:geolocation] = v.to_i
          else
            p[PREF_MAP[k]] = v
          end
        end
        options.add_preference(:profile, p)
      end
    end
  end
end
