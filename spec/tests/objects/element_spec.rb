require_relative '../../spec_helper'

describe 'Ferris Element' do
  let(:compliance_site) { ComplianceSite.new(browser: BROWSER, url: "file://#{ENV['PWD']}/spec/support/data/compliance_site") }

  it 'responds to keyword' do
    expect(compliance_site.elements_page.text_field).to respond_to :keyword
  end

  it 'can retrieve its keyword' do
    expect(compliance_site.elements_page.text_field.keyword).to eq(:text_field)
  end

  it 'is retrievable from a region' do
    expect(compliance_site.elements_header.title).to be_a Watir::Element
  end

  it 'is retrievable from a page' do
    expect(compliance_site.elements_page.text_field).to be_a Watir::Element
  end

  it 'is retrievable from a site' do
    expect(compliance_site.my_element).to be_a Watir::Element
  end

end
