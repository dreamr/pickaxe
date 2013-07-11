# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pickaxe/version'

Gem::Specification.new do |spec|
  spec.name          = "pickaxe"
  spec.version       = Pickaxe::VERSION
  spec.authors       = ["Dreamr OKelly"]
  spec.email         = ["dreamr.okelly@gmail.com"]
  spec.description   = %q{I got tired of doing this by hand}
  spec.summary       = %q{bundle gem + test setup!}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]
  
  spec.add_dependency "activesupport", "~> 4"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "minitest", "~> 4.2"
end
