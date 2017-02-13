require_relative '../lib/ferris'
require_relative 'support/site'

RSpec.configure do |config|

  config.include Ferris::SiteObject

  config.before(:each) do
    Ferris::Browser.browser = Watir::Browser.new :chrome
  end

  config.after(:each) do |_scenario|
    Ferris::Browser.browser.close
  end

end