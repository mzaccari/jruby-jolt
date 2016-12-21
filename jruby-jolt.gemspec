# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'jruby-jolt/version'

Gem::Specification.new do |s|
  s.name          = 'jruby-jolt'
  s.version       = Jolt::VERSION
  s.authors       = ['Michael Zaccari']
  s.email         = ['michael.zaccari@gmail.com']

  s.summary       = 'Jruby Jolt Wrapper'
  s.description   = 'A ready to go interface to Jolt for JRuby'
  s.homepage      = 'https://github.com/mzaccari/jruby-jolt'
  s.license       = 'MIT'
  s.platform      = 'java'
  s.files         = Dir['lib/**/*.rb', 'lib/**/*.jar']

  s.require_paths = ['lib']

  s.add_development_dependency "bundler", "~> 1.13"
  s.add_development_dependency "rake", "~> 10.0"
  s.add_development_dependency "rspec", "~> 3.0"
end
