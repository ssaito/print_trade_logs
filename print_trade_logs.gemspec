# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'print_trade_logs/version'

Gem::Specification.new do |spec|
  spec.name          = "print_trade_logs"
  spec.version       = PrintTradeLogs::VERSION
  spec.authors       = ["ssaito"]
  spec.email         = ["shinya.saito.25a@gmail.com"]
  spec.summary       = %q{Print trade logs from csv data.}
  spec.description   = %q{Print trade logs which is json format made from Rakuten Securities}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "thor", "~> 0.19"

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "pry-byebug"
end
