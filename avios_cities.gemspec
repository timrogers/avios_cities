# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'avios_cities/version'

Gem::Specification.new do |spec|
  spec.name          = "avios_cities"
  spec.version       = AviosCities::VERSION
  spec.authors       = ["Tim Rogers"]
  spec.email         = ["me@timrogers.co.uk"]

  spec.summary       = %q{Get access to up-to-date data on airports accessible using Avios air miles flying from or to London}
  spec.description   = %q{Get access to up-to-date data on airports accessible using Avios air miles flying from or to London}
  spec.homepage      = "https://github.com/timrogers/avios_cities"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }

  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.required_ruby_version = '>= 2.1'

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0", ">= 10.0"
  spec.add_development_dependency "rspec", "~> 3.3.0", ">= 3.3.0"
  spec.add_development_dependency "rspec-its", "~> 1.2.0", ">= 1.2.0"
  spec.add_development_dependency "pry", "~> 0.10.3", ">= 0.10.3"
end
