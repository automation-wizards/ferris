require_relative '../../spec_helper'

describe Ferris::Site do

  before(:all) do
    unless ENV['TRAVIS']
      system('docker run -d -p 4444:4444 --name selenium-hub selenium/hub:3.4.0-chromium')
      system('docker run --name chrome -d --link selenium-hub:hub selenium/node-chrome:3.4.0-chromium')
      sleep(5)
    end
  end

  after(:all) do
    unless ENV['TRAVIS']      
      system('docker stop selenium-hub chrome')
      system('docker rm selenium-hub chrome')
    end
  end

  context 'Browser Mutation' do 

    before(:all) do 
      Ferris::Browser.define(:local_chrome,  :local)
      Ferris::Browser.define(:has_switches,  :local,  ignore_ssl_errors: true)
      Ferris::Browser.define(:has_prefs,     :local,  geolocation: 2)
      Ferris::Browser.define(:headless,      :local,  headless: true)
      Ferris::Browser.define(:remote_chrome, :remote, browser: 'Chrome')
    end
    
    after(:each) do
      @website.close
    end

    it 'supports switches' do
      @website = Website.new(driver: :has_switches, url: BASE_URL)
      expect(@website).to be_a Ferris::Site
    end

    it 'supports headless' do
      @website = Website.new(driver: :headless, url: BASE_URL)
      expect(@website).to be_a Ferris::Site
    end

    it 'supports maximizing a headless window' do
      @website = Website.new(driver: :headless, url: BASE_URL)
      expect(@website.browser.window.maximize).to be_truthy
    end

    it 'supports re-sizing a headless window' do
      @website = Website.new(driver: :headless, url: BASE_URL)
      expect(@website.browser.window.resize_to 100, 100).to be_truthy
    end

   it 'supports prefs' do
     @website = Website.new(driver: :has_prefs, url: BASE_URL)
     expect(@website).to be_a Ferris::Site
    end

   it 'supports capabilities' do
     @website = Website.new(driver: :remote_chrome, url: BASE_URL)
      expect(@website).to be_a Ferris::Site
    end
  end
  
  context 'Local' do 
    before(:all) do
      @local_website = Website.new(driver: :local_chrome, url: BASE_URL)
    end

    after(:all) do
      @local_website.close
    end

    it 'is the correct object type' do
      expect(@local_website).to be_a Ferris::Site
    end

     it 'responds to attr site' do
      expect(@local_website).to respond_to :site
    end   

     it 'responds to attr s' do
      expect(@local_website).to respond_to :s
    end   

    it 'responds to attr url' do
      expect(@local_website).to respond_to :url
    end

    it 'responds to attr b' do
      expect(@local_website).to respond_to :b
    end    

    it 'responds to attr browser' do
      expect(@local_website).to respond_to :browser
    end    

    it 'responds to clear_cookies' do
     expect(@local_website).to respond_to :clear_cookies
    end 

    it 'site_args is a hash' do
      expect(@local_website.args).to be_a Hash
    end

     it 'can clear cookies' do
      expect(@local_website.clear_cookies).to be nil 
    end 

    it 'can retrieve its url' do
      expect( @local_website.url).to eql BASE_URL
    end
  end

  context 'Remote' do 
    before(:all) do
      @remote_website = Website.new(driver: :remote_chrome, url: BASE_URL)
    end

    after(:all) do
      @remote_website.close
    end

    it 'is the correct object type' do
      expect(@remote_website).to be_a Ferris::Site
    end

     it 'responds to attr site' do
      expect(@remote_website).to respond_to :site
    end   

     it 'responds to attr s' do
      expect(@remote_website).to respond_to :s
    end   

    it 'responds to attr args' do
      expect(@remote_website).to respond_to :args
    end

    it 'responds to attr url' do
      expect(@remote_website).to respond_to :url
    end

    it 'responds to attr b' do
      expect(@remote_website).to respond_to :b
    end      

    it 'responds to attr browser' do
      expect(@remote_website).to respond_to :browser
    end

    it 'responds to clear_cookies' do
     expect(@remote_website).to respond_to :clear_cookies
    end 

    it 'site args is a hash' do
      expect(@remote_website.args).to be_a Hash
    end

     it 'can clear cookies' do
      expect(@remote_website.clear_cookies).to be nil 
    end 

    it 'can retrieve its url' do
      expect( @remote_website.url).to eql BASE_URL
    end
  end
end
