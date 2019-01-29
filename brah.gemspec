# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'brah/version'

Gem::Specification.new do |spec|
  spec.name          = "brah"
  spec.version       = Brah::VERSION
  spec.authors       = ["Travis Yoder"]
  spec.email         = ["trayoda@gmail.com"]

  spec.summary       = %q{brah will open your github repo regardless if it's public or enterprise}
  spec.homepage      = "https://github.com/trayo/brah"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "bin"
  spec.executables   = ["brah"]
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "minitest", "~> 5.11", '>= 5.11.3'
  spec.add_development_dependency "mocha", "~> 1.8", '>= 1.8.0'
  spec.add_development_dependency "rake", "~> 10.5", '>= 10.5.0'
  spec.add_development_dependency "slop", "~> 4.6", '>= 4.6.2'
  spec.add_runtime_dependency "slop", "~> 4.6", '>= 4.6.2'
end
