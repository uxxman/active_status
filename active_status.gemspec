require_relative 'lib/active_status/version'

Gem::Specification.new do |spec|
  spec.name        = 'active_status'
  spec.version     = ActiveStatus::VERSION
  spec.email       = ['uxman.sherwani@gmail.com']
  spec.authors     = ['Muhammad Usman']
  spec.homepage    = 'https://github.com/uxxman/active_status'
  spec.summary     = 'Summary of RailsStatusCheck.'
  spec.description = 'Description of RailsStatusCheck.'
  spec.license     = 'MIT'

  spec.required_ruby_version = Gem::Requirement.new('>= 2.4.0')

  spec.metadata['homepage_uri']    = spec.homepage
  spec.metadata['source_code_uri'] = spec.homepage
  spec.metadata['changelog_uri']   = 'https://github.com/uxxman/active_status/releases'

  spec.files            = Dir['{app,config,db,lib}/**/*']
  spec.extra_rdoc_files = Dir['README.md', 'LICENSE.txt']

  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'rails', '>= 5.2'

  spec.add_development_dependency 'simplecov', '~> 0.19.1'
  spec.add_development_dependency 'rake', '~> 13.0', '>= 13.0.1'
  spec.add_development_dependency 'sqlite3', '~> 1.4', '>= 1.4.2'
  spec.add_development_dependency 'rspec-rails', '~> 4.0', '>= 4.0.1'
  spec.add_development_dependency 'rubocop-rails', '~> 2.8', '>= 2.8.1'
  spec.add_development_dependency 'rubocop-rspec', '~> 1.44', '>= 1.44.1'
  spec.add_development_dependency 'rubocop-performance', '~> 1.8', '>= 1.8.1'
end
