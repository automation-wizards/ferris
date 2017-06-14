require_relative '../../spec_helper'
require 'benchmark'

shared_examples 'Form Filling' do |inputs, retrieval_method|

  before(:all) do
    @website = Website.new(url: BASE_URL)
    @page = @website.elements_pg
  end

  after(:all) do
    @website.close
  end
  
  let(:text) { { text_field: 'Apple', password: 'MyPassword123#1', website: 'http://www.google.ca', email: 'ferris@bueller.ca', phone: '4165555555', search: 'Apples', number: '10564', error: 'Error!', valid: 'Valid!', text_area: 'This is a long text string with a lot of content in it' }}
  let(:select_list_text)  { { select_list: 'Option Three' } }
  let(:select_list_value) { { select_list: '2'}  }
  let(:checkbox)          { { checkbox_1: true, checkbox_2: false, checkbox_3: true } }
  let(:radio)             { { radio_3: true } }
  let(:button)            { { button_btn: true } } 

  let(:form_data) { send(inputs) }        
  let(:website_data) { Hash[form_data.map { |k, _v| [k, @page.send(k).send(retrieval_method)] }] }

  it 'accurately populates with fill' do
    @page.visit.fill(form_data)
    if inputs == :select_list_text
      expect(Hash[form_data.map { |k, _v| [k, @page.send(k).selected_options.first.text]}] ).to include form_data
    else 
      expect(website_data).to include form_data
    end
  end

  it 'accurately populates with fill!' do
    @page.visit.fill!(form_data)
    if inputs == :select_list_text
      expect(Hash[form_data.map { |k, _v| [k, @page.send(k).selected_options.first.text]}] ).to include form_data
    else 
      expect(website_data).to include form_data
    end
  end

  it 'fill! is better than fill' do
    @page.visit
    watir = Benchmark.measure { @page.fill(form_data) }
    @page.visit
    ferris = Benchmark.measure { @page.fill!(form_data) }
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