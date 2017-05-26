require_relative '../../spec_helper'

describe Ferris::Region do
  let(:compliance_site) { ComplianceSite.new(browser: BROWSER, url: "file://#{ENV['PWD']}/spec/support/data/compliance_site") }

  it 'is the correct object type' do
    expect(compliance_site.elements_header).to be_a Ferris::Region
  end

  it 'responds to exists?' do
    expect(compliance_site.elements_header).to respond_to :exists?
  end

  it 'responds to present?' do
    expect(compliance_site.elements_header).to respond_to :present?
  end

  it 'does not respond to click' do
    expect(compliance_site.elements_header).not_to respond_to :click
  end

end
