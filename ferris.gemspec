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

  root_path      = File.dirname(__FILE__)
  all_files      = Dir.chdir(root_path) { Dir.glob("**/{*,.*}") }
  all_files.reject! { |file| [".", ".."].include?(File.basename(file)) }
  all_files.reject! { |file| file.start_with?("website/") }
  gitignore_path = File.join(root_path, ".gitignore")
  gitignore      = File.readlines(gitignore_path)
  gitignore.map!    { |line| line.chomp.strip }
  gitignore.reject! { |line| line.empty? || line =~ /^(#|!)/ }
  unignored_files = all_files.reject do |file|
    next true if File.directory?(file)
    gitignore.any? do |ignore|
      File.fnmatch(ignore, file, File::FNM_PATHNAME) ||
        File.fnmatch(ignore, File.basename(file), File::FNM_PATHNAME)
    end
  end
 
  spec.files         = unignored_files
  spec.executables   = unignored_files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = unignored_files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency             'watir', '~> 6.1'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'coveralls'
end
