require_relative '../../spec_helper'

describe Ferris::Site do
  let(:responsive_site) { ResponsiveSite.new(browser: BROWSER, url: "file://#{ENV['PWD']}/spec/support/data/responsive_site") }
  let(:compliance_site) { ComplianceSite.new(browser: BROWSER, url: "file://#{ENV['PWD']}/spec/support/data/compliance_site") }

  describe 'Compliance Site' do
    it 'is the correct object type' do
      expect(compliance_site).to be_a Ferris::Site
    end

    it 'responds to url' do
      expect(compliance_site).to respond_to :url
    end

    it 'can retrieve its url' do
      expect(compliance_site.url).to eql "file://#{ENV['PWD']}/spec/support/data/compliance_site"
    end


    it 'can retrieve its url' do
      expect(responsive_site.url).to eql "file://#{ENV['PWD']}/spec/support/data/responsive_site"
    end

  end

  describe 'Responsive Site' do
    it 'is the correct object type' do
      expect(responsive_site).to be_a Ferris::Site
    end

    it 'responds to url' do
      expect(compliance_site).to respond_to :url
    end

    it 'can retrieve its url' do
      expect(responsive_site.url).to eql "file://#{ENV['PWD']}/spec/support/data/responsive_site"
    end
  end

end
