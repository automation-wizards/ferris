require 'spec_helper'
require 'benchmark'

describe Ferris::Core do
  let(:site) { TestSite.new }
  let(:data) { FormData.new }

  context 'Text' do

    let(:text_results) { Hash[data.text_input.map { |k, _v| [k, site.home_page.send(k).value] }] }

    it 'can call do' do
      site.home_page.visit.do(data.text_input)
      expect(text_results).to include data.text_output
    end

    it 'can call do!' do
      site.home_page.visit.do!(data.text_input)
      expect(text_results).to include data.text_output
    end

    it 'do! is better than do' do
      watir = Benchmark.measure { site.home_page.visit.do(data.text_input) }
      ferris = Benchmark.measure { site.home_page.visit.do!(data.text_input) }
      expect(ferris.real).to be < watir.real
    end

  end

  context 'Select List' do

    let(:select_results) { Hash[data.select_input.map { |k, _v| [k, site.home_page.send(k).value] }] }

    it 'can call do' do
      site.home_page.visit.do(data.select_input)
      expect(select_results).to include data.select_output
    end

    it 'can call do!' do
      site.home_page.visit.do!(data.select_input)
      expect(select_results).to include data.select_output
    end

    it 'do! is better than do' do
      watir = Benchmark.measure { site.home_page.visit.do(data.select_input) }
      ferris = Benchmark.measure { site.home_page.visit.do!(data.select_input) }
      expect(ferris.real).to be < watir.real
    end

  end

  context 'Checkboxes' do

    let(:checkbox_results) { Hash[data.checkbox_input.map { |k, _v| [k, site.home_page.send(k).checked?] }] }

    it 'can call do' do
      site.home_page.visit.do(data.checkbox_input)
      expect(checkbox_results).to include data.checkbox_output
    end

    it 'can call do!' do
      site.home_page.visit.do!(data.checkbox_input)
      expect(checkbox_results).to include data.checkbox_output
    end

    it 'do! is better than do' do
      watir = Benchmark.measure { site.home_page.visit.do(data.checkbox_input) }
      ferris = Benchmark.measure { site.home_page.visit.do!(data.checkbox_input) }
      expect(ferris.real).to be < watir.real
    end

  end

  context 'Radios' do

    let(:radio_results) { Hash[data.radio_input.map { |k, _v| [k, site.home_page.send(k).set?] }] }

    it 'can call do' do
      site.home_page.visit.do(data.radio_input)
      expect(radio_results).to include data.radio_output
    end

    it 'can call do!' do
      site.home_page.visit.do!(data.radio_input)
      expect(radio_results).to include data.radio_output
    end

    it 'do! is better than do' do
      watir = Benchmark.measure { site.home_page.visit.do(data.radio_input) }
      ferris = Benchmark.measure { site.home_page.visit.do!(data.radio_input) }
      expect(ferris.real).to be < watir.real
    end
  end


end
