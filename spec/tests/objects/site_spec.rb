require_relative '../../spec_helper'

describe Ferris::Site do
  context 'Browser Mutation' do 

    after(:each) do
      @website.close
    end

    it 'supports the default driver' do
      @website = Website.new(url: BASE_URL)
      expect(@website).to be_a Ferris::Site
    end

    it 'supports a custom driver' do
      @website = Website.new(driver: :my_custom, url: BASE_URL)
      expect(@website).to be_a Ferris::Site
    end

    it 'supports switches' do
      @website = Website.new(ignore_ssl_errors: true, url: BASE_URL)
      expect(@website).to be_a Ferris::Site
    end

    it 'supports headless' do
      @website = Website.new(headless: true, url: BASE_URL)
      expect(@website).to be_a Ferris::Site
    end

    it 'supports maximizing a headless window' do
      @website = Website.new(headless: true, url: BASE_URL)
      expect(@website.browser.window.maximize).to be_truthy
    end

    it 'supports re-sizing a headless window' do
      @website = Website.new(headless: true, url: BASE_URL)
      expect(@website.browser.window.resize_to 100, 100).to be_truthy
    end

   it 'supports prefs' do
     @website = Website.new(geolocation:2, url: BASE_URL)
     expect(@website).to be_a Ferris::Site
    end

   it 'supports capabilities' do
     @website = Website.new(driver: :remote_chrome, url: BASE_URL)
      expect(@website).to be_a Ferris::Site
    end
  end
  
  context 'Local' do 
    before(:all) do
      @local_website = Website.new(url: BASE_URL)
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
