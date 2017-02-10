# coding: utf-8

Gem::Specification.new do |spec|
  spec.name          = 'ferris_watir'
  spec.version       = '0.1.0'
  spec.authors       = ['Automation Wizards']
  spec.email         = ['Justin.Commu@loblaw.ca']

  spec.summary       = 'Next level web testing framework'
  spec.description   = 'An un-opinionated testing framework built on top of WATIR which provides massive power with minimal DSL. '
  spec.homepage      = 'https://loblawdigital.ca'
  spec.license       = 'MIT'

  spec.files         = Dir['LICENSE', 'README.md','CHANGES.md' ,'lib/**/*']
  spec.bindir        = 'exe'
  spec.platform      = Gem::Platform::RUBY
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_runtime_dependency     'watir',       '>= 6.0.2'
  spec.add_development_dependency 'watir_model', '>= 0.2.2'
  spec.add_development_dependency 'rspec',       '>= 3.5.0'

end
