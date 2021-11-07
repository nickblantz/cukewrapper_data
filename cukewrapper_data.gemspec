# frozen_string_literal: true

require_relative 'lib/cukewrapper_data/version'

Gem::Specification.new do |spec|
  spec.name = 'cukewrapper_data'
  spec.version = CukewrapperData::VERSION
  spec.authors = ['Nick Blantz']
  spec.email = ['nicholasblantz@gmail.com']

  spec.summary = 'Provides a wrapper for online testing tools with Cucumber'
  spec.description = File.read('README.md')
  spec.homepage = 'https://github.com/nickblantz'
  spec.license = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.6.0')
  spec.files = [
    'lib/cukewrapper_data.rb',
    'lib/cukewrapper/cukewrapper_data.rb'
  ]
  spec.add_development_dependency 'rubocop', '~> 1.0'
  spec.add_dependency 'cukewrapper', '~> 0.0'
  spec.add_runtime_dependency 'json', '~> 2.0'
end
