# frozen_string_literal: true

require_relative 'lib/usage_meter/version'

Gem::Specification.new do |spec|
  spec.name        = 'usage_meter'
  spec.version     = UsageMeter::VERSION
  spec.authors     = ['James P. McGrath']
  spec.email       = ['gems@jamespmcgrath.com']
  spec.homepage    = 'https://github.com/jpmcgrath/usage_meter'
  spec.summary     = 'A Rails engine to track usage metrics of features'
  spec.description = 'A Rails engine to track usage metrics of features, useful for implementing usage-based billing.'
  spec.license     = 'TBD'
  spec.required_ruby_version = '>= 3.0.0'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/jpmcgrath/usage_meter'
  spec.metadata['changelog_uri'] = 'https://github.com/jpmcgrath/usage_meter'
  spec.metadata['rubygems_mfa_required'] = 'true'

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir['{app,config,db,lib}/**/*', 'LICENSE.txt', 'Rakefile', 'README.md']
  end

  spec.add_dependency 'rails', '>= 7.0.0'

  spec.add_development_dependency 'factory_bot_rails'
  spec.add_development_dependency 'mysql2', '>= 0.5.7'
  spec.add_development_dependency 'pg', '~> 1.6.2'
  spec.add_development_dependency 'reek', '6.5.0'
  spec.add_development_dependency 'rspec-rails', '>= 7.0.0'
  spec.add_development_dependency 'rubocop', '~> 1.81.0'
  spec.add_development_dependency 'rubocop-performance', '~> 1.26.1'
  spec.add_development_dependency 'rubocop-rails', '~> 2.33.0'
  spec.add_development_dependency 'rubocop-rspec'
  spec.add_development_dependency 'rubocop-rspec_rails'
  spec.add_development_dependency 'shoulda-matchers'
  spec.add_development_dependency 'simplecov'
  spec.add_development_dependency 'sqlite3', '>= 2.0.0'
end
