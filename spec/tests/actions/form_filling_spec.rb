require_relative '../../spec_helper'
require 'benchmark'

shared_examples 'Form Filling' do |inputs, retrieval_method|

  before(:all) do
    @website = Website.new(:local, url: BASE_URL)
    @page = @website.elements_pg
  end

  after(:all) do
    @website.close
  end
  
  let(:input_data)   { HTML5DemoFormData.new.send(inputs) }
  let(:website_data) { Hash[input_data.map { |k, _v| [k, @page.send(k).send(retrieval_method)] }] }

  it 'accurately populates with fill' do
    @page.visit.fill(input_data)
    if inputs == :select_list_text
      expect(Hash[input_data.map { |k, _v| [k, @page.send(k).selected_options.first.text]}] ).to include input_data
    else 
      expect(website_data).to include input_data
    end
  end

  it 'accurately populates with fill!' do
    @page.visit.fill!(input_data)
    if inputs == :select_list_text
      expect(Hash[input_data.map { |k, _v| [k, @page.send(k).selected_options.first.text]}] ).to include input_data
    else 
      expect(website_data).to include input_data
    end
  end

  it 'fill! is better than fill' do
    @page.visit
    watir = Benchmark.measure { @page.fill(input_data) }
    @page.visit
    ferris = Benchmark.measure { @page.fill!(input_data) }
    expect(ferris.real).to be < watir.real
  end

end

describe 'Ferris Actions' do
  describe('Text') { it_supports 'Form Filling', :text, :value }
  describe('Select List (Text)') { it_supports 'Form Filling', :select_list_text, :text }
  describe('Select Lists (Value)') { it_supports 'Form Filling', :select_list_value, :value }
  describe('Checkboxes') { it_supports 'Form Filling', :checkbox, :checked? }
  describe('Radios') { it_supports 'Form Filling', :radio, :set? }
  describe('Buttons') { it_supports 'Form Filling', :button, :exists? } #hack to add coverage, no way to assert action happen.
end