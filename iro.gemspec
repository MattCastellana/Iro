# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'iro/version'

Gem::Specification.new do |spec|
  spec.name          = "iro"
  spec.version       = Iro::VERSION
  spec.authors       = ["Matthew Castellana"]
  spec.email         = ["mattcastellana@gmail.com"]

  spec.summary       = "A gem to give colorized terminal output"
  spec.description   = "A gem to give colorized terminal output"
  spec.homepage      = "https://github.com/MattCastellana/Iro"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
end
