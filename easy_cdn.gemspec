$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "easy_cdn/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "easy_cdn"
  s.version     = EasyCdn::VERSION
  s.authors     = ["Nikola Geneshki"]
  s.email       = ["ngeneshki@gmail.com"]
  s.homepage    = "https://github.com/insignificantMe/easy_cdn"
  s.summary     = "A Rails plugin for easy usage of cdn resources"
  s.description = "Attempts to provide easy way for using cdn resources while having dev versions of them in development environment"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.1.9"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "capybara"
  s.add_development_dependency "factory_girl_rails"
  s.add_development_dependency "sqlite3"
  s.add_development_dependency "byebug"
  s.add_development_dependency "capybara-screenshot"

  s.test_files = Dir["spec/**/*"]
end
