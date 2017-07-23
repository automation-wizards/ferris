require 'coveralls'
Coveralls.wear!

require 'ferris'
require 'pry'

require_relative 'support/site'

BASE_URL = 'https://automation-wizards.github.io/ferris'

Watir.default_timeout = 1

Ferris::Browser.define(:my_default,  :local)
Ferris::Browser.define(:my_custom,   :local, ignore_ssl_errors: true)
Ferris::Browser.define(:remote_chrome, :remote, browser: 'chrome')
Ferris::Browser.default = :my_default

RSpec.configure do |config|
  config.alias_it_should_behave_like_to :it_supports, ''

  
  config.before(:suite) do
    system('docker stop hub && docker rm hub || die')
    system('docker run --name hub -d -p 4444:4444 selenium/standalone-chrome:latest')
  end

  config.after(:suite) do
    system('docker stop hub && docker rm hub || die')
  end


end
