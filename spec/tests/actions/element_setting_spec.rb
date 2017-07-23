require_relative '../../spec_helper'

describe 'Monkey Patches' do

  before(:all) do
    @website = Website.new(url: BASE_URL)
    @element = @website.elements_pg.text_field
  end

  after(:all) do
    @website.close
  end
  
  context 'Watir Elements' do
    it 'can call do' do
      expect(@element).to respond_to :do
    end

    it 'can call do!' do
      expect(@element).to respond_to :do!
    end

  end

end
