# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'watir_performance/version'

Gem::Specification.new do |spec|
  spec.name          = "watir_performance"
  spec.version       = WatirPerformance::VERSION
  spec.authors       = ["Titus Fortner"]
  spec.email         = ["titusfortner@gmail.com"]
  spec.summary       = %q{This checks performance of locators}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", "~> 2.0"
  spec.add_development_dependency 'headless'
  spec.add_development_dependency 'descriptive_statistics'
end
