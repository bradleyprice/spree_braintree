# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'spree_braintree/version'

Gem::Specification.new do |spec|
  spec.name          = "spree_braintree"
  spec.version       = SpreeBraintree::VERSION
  spec.authors       = ["Spree Team"]
  spec.email         = ["contact@spree.io"]

  spec.summary       = %q{Adds Spree support for Braintree v.zero Gateway.}
  spec.description   = %q{Adds Spree support for Braintree v.zero Gateway.}
  spec.homepage      = "https://spree.io"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # spec.add_dependency "spree", ["~> 3.1.0.beta"]
  spec.add_dependency "spree_core", "~> 3.0.5"
  spec.add_dependency "braintree", "~> 2.46"

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency 'factory_girl', '~> 4.4'
  spec.add_development_dependency 'rspec-rails'
  spec.add_development_dependency 'ffaker'
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "guard"
  spec.add_development_dependency "guard-rspec"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "pry-byebug"
  spec.add_development_dependency 'sqlite3'
  spec.add_development_dependency 'database_cleaner', '~> 1.2.0'
  spec.add_development_dependency "vcr"
  spec.add_development_dependency "webmock"
end
