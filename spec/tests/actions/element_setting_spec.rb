require_relative '../../spec_helper'

describe 'Monkey Patches' do
  let(:compliance_site) { ComplianceSite.new(browser: BROWSER, url: "file://#{ENV['PWD']}/spec/support/data/compliance_site") }
  
  context 'Watir Elements' do
    it 'can call do' do
      compliance_site.elements_page.visit
      compliance_site.elements_page.text_field.do 'Apple'
      expect(compliance_site.elements_page.text_field.value).to eql 'Apple'
    end

    it 'can call do!' do
      compliance_site.elements_page.visit
      compliance_site.elements_page.text_field.do! 'Apple'
      expect(compliance_site.elements_page.text_field.value).to eql 'Apple'
    end

  end

end
