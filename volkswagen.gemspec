# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'volkswagen/version'

Gem::Specification.new do |spec|
  spec.name          = "volkswagen"
  spec.version       = Volkswagen::VERSION
  spec.authors       = ["Carl Jackson"]
  spec.email         = ["carl@avtok.com"]

  spec.summary       = %q{Volkswagen behaves differently under CI and in prod}
  spec.description   = %q{Volkswagen behaves differently under CI and in prod}
  spec.homepage      = "https://github.com/zenazn/volkswagen"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest"
end
