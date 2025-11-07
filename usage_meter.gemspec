require_relative "lib/usage_meter/version"

Gem::Specification.new do |spec|
  spec.name        = "usage_meter"
  spec.version     = UsageMeter::VERSION
  spec.authors     = [ "James P. McGrath" ]
  spec.email       = [ "james@shippit.com" ]
  spec.homepage    = "https://github.com/jpmcgrath/usage_meter"
  spec.summary     = "A Rails engine to track usage metrics of features"
  spec.description = "A Rails engine to track usage metrics of features, useful for implementing usage-based billing."
  spec.license     = "TBD"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/jpmcgrath/usage_meter"
  spec.metadata["changelog_uri"] = "https://github.com/jpmcgrath/usage_meter"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  end

  spec.add_dependency "rails", ">= 7.1.0"
end
