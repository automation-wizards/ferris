require_relative '../../spec_helper'

describe Ferris::Page do
  let(:compliance_site) { ComplianceSite.new(browser: BROWSER, url: "file://#{ENV['PWD']}/spec/support/data/compliance_site") }

  it 'is the correct object type' do
    expect(compliance_site.elements_page).to be_a Ferris::Page
  end

  it 'responds to visit' do
    expect(compliance_site.elements_page).to respond_to :visit
  end

  it 'responds to title' do
    expect(compliance_site.elements_page).to respond_to :title
  end

  it 'responds to url' do
    expect(compliance_site.elements_page).to respond_to :url
  end

  it 'can retrieve its title' do
    expect(compliance_site.elements_page.title).to eql 'HTML5 Test Page'
  end

  it 'can retrieve its url' do
    expect(compliance_site.elements_page.url).to eql "file://#{ENV['PWD']}/spec/support/data/compliance_site/index.html"
  end
end
