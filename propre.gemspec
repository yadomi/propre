# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'propre/version'

Gem::Specification.new do |spec|
  spec.authors       = ["Felix Yadomi"]
  spec.email         = ["dev.yadomi@gmail.com"]

  spec.name          = "propre"
  spec.version       = Version::VERSION
  spec.summary       = %q{CLI tool to rename movies using TheMovieDB API }

  spec.files         = `git ls-files`.split($\)
  spec.executables   = ['propre']
  spec.require_paths = ["lib"]
  
  spec.add_dependency "parseconfig", "~> 1.0.6"
  spec.add_dependency "themoviedb", "~> 0.0.24"
  spec.add_dependency "mime-types", "~> 2.4.3"
  spec.add_dependency "highline", "~> 1.6.21"

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"

end
