require_relative "lib/act_as_subscriptable/version"

Gem::Specification.new do |spec|
  spec.name        = "act_as_subscriptable"
  spec.version     = ActAsSubscriptable::VERSION
  spec.authors     = ["Dylan Lin"]
  spec.email       = ["dylanmail0203@gmail.com"]
  spec.homepage    = "https://github.com/Dylan0203/act_as_subscriptable"
  spec.summary     = "Summary of ActAsSubscriptable."
  spec.description = "Description of ActAsSubscriptable."
  spec.license     = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  spec.metadata["allowed_push_host"] = "Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/Dylan0203/act_as_subscriptable"
  spec.metadata["changelog_uri"] = "https://github.com/Dylan0203/act_as_subscriptable"

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "rails", "~> 6.1.7"
  spec.add_development_dependency "rspec-rails"
end
