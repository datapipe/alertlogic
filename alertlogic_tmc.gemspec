# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'alertlogic_tmc/version'

Gem::Specification.new do |gem|
  gem.name          = "alertlogic_tmc"
  gem.version       = AlertlogicTmc::VERSION
  gem.authors       = ["atistler"]
  gem.email         = ["atistler@datapipe.com"]
  gem.description   = %q{AlertlogicTmc API}
  gem.summary       = %q{AlertlogicTmc API}
  gem.homepage      = ""

  gem.platform      = Gem::Platform::RUBY
  gem.files         = `git ls-files`.split("\n")
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  gem.add_dependency 'multi_json'
  gem.add_dependency 'uri'
end
