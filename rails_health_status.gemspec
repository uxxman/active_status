require_relative 'lib/rails_health_status/version'

Gem::Specification.new do |spec|
  spec.name        = 'rails_health_status'
  spec.version     = RailsHealthStatus::VERSION
  spec.email       = ['uxman.sherwani@gmail.com']
  spec.authors     = ['Muhammad Usman']
  spec.homepage    = 'https://github.com/uxxman/rails_health_status'
  spec.summary     = 'Summary of RailsStatusCheck.'
  spec.description = 'Description of RailsStatusCheck.'
  spec.license     = 'MIT'

  spec.required_ruby_version = Gem::Requirement.new('>= 2.4.0')

  spec.metadata['homepage_uri']    = spec.homepage
  spec.metadata['source_code_uri'] = spec.homepage
  spec.metadata['changelog_uri']   = 'https://github.com/uxxman/rails_health_status/releases'

  spec.files            = Dir['{app,config,db,lib}/**/*']
  spec.extra_rdoc_files = Dir['README.md', 'LICENSE.txt']

  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'rails', '>= 5.2'
end
