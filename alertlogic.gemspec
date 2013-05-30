# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'alertlogic/version'

Gem::Specification.new do |gem|
  gem.name          = "alertlogic"
  gem.version       = Alertlogic::VERSION
  gem.authors       = ["atistler"]
  gem.email         = ["atistler@datapipe.com"]
  gem.description   = %q{Alertlogic API}
  gem.summary       = %q{Alertlogic API}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  gem.add_dependency 'multi_json'
end
