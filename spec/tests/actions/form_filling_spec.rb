require_relative '../../spec_helper'
require 'benchmark'

shared_examples 'Form Filling' do |inputs, outputs, lookup|

  let(:compliance_site) { ComplianceSite.new(browser: BROWSER, url: "file://#{ENV['PWD']}/spec/support/data/compliance_site") }

  let(:data_set) { HTML5DemoFormData.new }
  let(:form_data) { data_set.send(inputs) }
  let(:expected_output) { data_set.send(outputs) }
  let(:found_result) { Hash[form_data.map { |k, _v| [k, compliance_site.elements_page.send(k).send(lookup)] }] }

  it 'can call fill' do
    compliance_site.elements_page.visit.fill(form_data)
    expect(found_result).to include expected_output
  end

  it 'can call fill!' do
    compliance_site.elements_page.visit.fill!(form_data)
    expect(found_result).to include expected_output
  end

  it 'fill! is better than fill' do
    watir = Benchmark.measure { compliance_site.elements_page.visit.fill(form_data) }
    ferris = Benchmark.measure { compliance_site.elements_page.visit.fill!(form_data) }
    expect(ferris.real).to be < watir.real
  end

end


describe 'Ferris Actions' do
  describe('Text') { it_supports 'Form Filling', :text_input, :text_output, :value }
  describe('Select Lists') { it_supports 'Form Filling', :select_input, :select_output, :value }
  describe('Checkboxes') { it_supports 'Form Filling', :checkbox_input, :checkbox_output, :checked? }
  describe('Radios') { it_supports 'Form Filling', :radio_input, :radio_output, :set? }
end