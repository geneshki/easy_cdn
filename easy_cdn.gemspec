# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'easy_cdn/version'

Gem::Specification.new do |spec|
  spec.name          = "easy_cdn"
  spec.version       = EasyCdn::VERSION
  spec.authors       = ["Nikola Geneshki"]
  spec.email         = ["ngeneshki@gmail.com"]
  spec.summary       = %q{Makes it easy to use a cdn for certain files}
  spec.description   = %q{If you want to use a cdn for 
some of the files but not all of the assets, 
this plugin is for you.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rails", "~> 4.1.6"
end
