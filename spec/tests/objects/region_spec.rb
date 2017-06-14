require_relative '../../spec_helper'
require 'benchmark'

describe 'Ferris' do

  before(:all) do
    @website = Website.new(url: BASE_URL)
    @region = @website.header
  end

  after(:all) do
    @website.close
  end
  
  context 'Region' do 
    it 'is the correct object type' do
      expect(@region).to be_a Ferris::Region
    end

    it 'responds to attr site' do
      expect(@region).to respond_to :site
    end    

    it 'responds to attr s' do
      expect(@region).to respond_to :s
    end  

    it 'responds to attr browser' do
      expect(@region).to respond_to :browser
    end    

    it 'responds to attr b' do
      expect(@region).to respond_to :b
    end   

    it 'responds to attr r' do
      expect(@region).to respond_to :r
    end    

    it 'responds to attr root' do
      expect(@region).to respond_to :root
    end    

    it 'responds to exists?' do
      expect(@region).to respond_to :exists?
    end

    it 'responds to present?' do
      expect(@region).to respond_to :present?
    end

    it 'does not respond to click' do
      expect(@region).not_to respond_to :click
    end
  end
  
  context 'Regions' do 

    before(:all) do 
      @website.visit
      @regions = @website.articles
    end

    it 'is the correct object type' do
      expect(@regions).to be_a Enumerable
    end
    
    it 'knows its size' do
      expect(@regions.size).to eq 16
    end

    it 'responds to attr site' do
      expect(@regions.first).to respond_to :site
    end    

    it 'responds to attr s' do
      expect(@regions.first).to respond_to :s
    end  

    it 'responds to attr browser' do
      expect(@regions.first).to respond_to :browser
    end    

    it 'responds to attr b' do
      expect(@regions.first).to respond_to :b
    end    

    it 'responds to attr r' do
      expect(@regions.first).to respond_to :r
    end    

    it 'responds to attr root' do
      expect(@regions.first).to respond_to :root
    end    

    it 'responds to exists?' do
      expect(@regions.first).to respond_to :exists?
    end

    it 'responds to present?' do
      expect(@regions.first).to respond_to :present?
    end

    it 'does not respond to click' do
      expect(@regions.first).not_to respond_to :click
    end

  end

end
