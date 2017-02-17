# coding: utf-8

Gem::Specification.new do |spec|
  spec.name          = 'ferris_watir'
  spec.version       = '0.1.1'
  spec.authors       = ['Automation Wizards']
  spec.email         = ['Justin.Commu@loblaw.ca']

  spec.summary       = 'Next level web testing framework'
  spec.description   = 'An un-opinionated tes framework built on top of Watir'
  spec.homepage      = 'https://loblawdigital.ca'
  spec.license       = 'MIT'

  spec.files         = Dir['LICENSE', 'README.md', 'CHANGES.md', 'lib/**/*']
  spec.bindir        = 'exe'
  spec.platform      = Gem::Platform::RUBY
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_runtime_dependency     'watir',       '>= 6.2.0'
  spec.add_development_dependency 'watir_model', '>= 0.2.2'
  spec.add_development_dependency 'rspec',       '>= 3.5.0'
end
