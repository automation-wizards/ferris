# coding: utf-8

Gem::Specification.new do |spec|
  spec.name          = 'ferris_watir'
  spec.version       = '1.0.0'
  spec.platform      = Gem::Platform::RUBY
  spec.authors       = ['Automation Wizards']
  spec.email         = ['Justin.Commu@loblaw.ca']
  spec.homepage      = 'https://loblawdigital.ca'
  spec.summary       = 'Functionally minded Site, Page, and Region objects'
  spec.description   = 'An opinionated test framework built on top of Watir'
  spec.license       = 'MIT'
  spec.files         = `git ls-files`.split("\n")
  spec.test_files    = `git ls-files -- {spec}/*`.split("\n")
  spec.require_paths = ['lib']

  spec.add_dependency             'watir', '~> 6.1'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'parallel_tests'
  spec.add_development_dependency 'coveralls'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'watir_model'
  spec.add_development_dependency 'pry'
end
