require_relative '../../spec_helper'
require 'benchmark'

describe Ferris::Page do

  before(:all) do
    @website = Website.new(:local, url: BASE_URL)
    @page = @website.elements_pg
  end

  after(:all) do
    @website.close
  end

  it 'is the correct object type' do
    expect(@page).to be_a Ferris::Page
  end

  it 'responds to visit' do
    expect(@page).to respond_to :visit
  end

  it 'responds to title' do
    expect(@page).to respond_to :title
  end

  it 'responds to url' do
    expect(@page).to respond_to :url
  end

  it 'responds to fill' do
    expect(@page).to respond_to :fill    
  end

  it 'responds to fill!' do
    expect(@page).to respond_to :fill!    
  end  

  it 'can retrieve its title' do
    expect(@page.title).to be_a String
  end

  it 'can retrieve its url' do
    expect(@page.url).to be_a String
  end

end
