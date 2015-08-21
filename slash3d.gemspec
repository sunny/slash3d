# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'slash3d/version'

Gem::Specification.new do |spec|
  spec.name          = "slash3d"
  spec.version       = Slash3D::VERSION
  spec.authors       = ["Sunny Ripert"]
  spec.email         = ["sunny@sunfox.org"]
  spec.summary       = %q{Access 3D Slash's API}
  # spec.description   = %q{TODO: Write a longer description. Optional.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(spec)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "activesupport"
  # spec.add_dependency "securerandom"

  # Tasks for gem development
  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"

  # Specs
  spec.add_development_dependency "rspec"

  # Block HTTP connections in specs
  # spec.add_development_dependency "webmock"
end
