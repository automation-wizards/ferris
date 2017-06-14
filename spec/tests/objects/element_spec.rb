require_relative '../../spec_helper'
require 'benchmark'

describe 'Ferris Element' do
  before(:all) do
    @website = Website.new(url: BASE_URL)
  end

  after(:all) do
    @website.close
  end

  it 'is retrievable from a page' do
    expect(@website.elements_pg.text_field).to be_a Watir::Element
  end

  it 'is retrievable from a region' do
    expect(@website.header.title).to be_a Watir::Element
  end

end
