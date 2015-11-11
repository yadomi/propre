# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'propre/version'

Gem::Specification.new do |spec|
  spec.authors       = ['Felix Yadomi']
  spec.email         = ['dev.yadomi@gmail.com']

  spec.name          = 'propre'
  spec.version       = Version::VERSION
  spec.summary       = 'CLI tool to sanitize movies filename'

  spec.files         = `git ls-files`.split($ORS)
  spec.executables   = ['propre']
  spec.require_paths = ['lib']

  spec.add_dependency 'thor', '~> 0.19.1'
  spec.add_dependency 'json', '~> 1.8.3'
  spec.add_dependency 'colorize', '~> 0.7.7'

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'
end
