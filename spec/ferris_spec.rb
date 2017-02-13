require 'spec_helper'

describe "Wikipedia Home Page" do
  it 'can search' do
    home_page.visit
    home_page.search('Apple')
    expect(apple_page.loaded?).to be_truthy
  end
end