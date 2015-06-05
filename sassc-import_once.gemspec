# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sassc/import_once/version'

Gem::Specification.new do |spec|
  spec.name          = "sassc-import_once"
  spec.version       = SassC::ImportOnce::VERSION
  spec.authors       = ["Paul Kmiec"]
  spec.email         = ["paul.kmiec@appfolio.com"]
  spec.summary       = %q{Changes the behavior of Sassc's @import directive to only import a file once.}
  spec.description   = %q{Changes the behavior of Sassc's @import directive to only import a file once.}
  spec.homepage      = "https://github.com/appfolio/sassc-import_once"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "sassc", "~> 1.2"
  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "minitest"
  spec.add_development_dependency "sassc-rails"
end
