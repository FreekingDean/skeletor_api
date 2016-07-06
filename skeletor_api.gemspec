# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'skeletor_api/version'

Gem::Specification.new do |spec|
  spec.name          = "skeletor_api"
  spec.version       = SkeletorApi::VERSION
  spec.authors       = ["Dean"]
  spec.email         = ["deangalvin3@gmail.com"]

  spec.summary       = "The api client for accessing skeletor."
  spec.description   = "The api client for accessing skeletor."
  spec.homepage      = "https://www.github.com"
  spec.license       = "MIT"

  spec.files         = Dir.glob("{bin,lib}/**/*")
  spec.bindir        = "bin"
  spec.require_paths = ["lib"]

  spec.add_dependency "faraday"

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
