# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ka_ext_users/version'

Gem::Specification.new do |spec|
  spec.name          = "ka_ext_users"
  spec.version       = KaExtUsers::VERSION
  spec.authors       = ["Buzachis Aris"]
  spec.email         = ["buzachis.aris@gmail.com"]
  spec.description   = %q{KA Users extension gem.}
  spec.summary       = %q{KA Users extension gem.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib","app/api"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"

  spec.add_dependency 'rails', '~> 4.0.0'
  spec.add_dependency 'activerecord', '~> 4.0.0'
  spec.add_dependency 'mysql2'
  spec.add_dependency 'roar-rails'
end
