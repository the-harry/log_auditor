# frozen_string_literal: true

require_relative 'lib/log_auditor/version'

Gem::Specification.new do |spec|
  spec.name = 'log_auditor'
  spec.version = LogAuditor::VERSION
  spec.authors = ['the-harry']
  spec.email = ['matheusthebr@gmail.com']

  spec.summary = 'Simple log parser for ip and routes.'
  spec.description = 'Simple log parser for ip and routes.'
  spec.homepage = 'https://github.com/the-harry/log_auditor'
  spec.license = 'MIT'
  spec.required_ruby_version = '>= 3.0.2'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/the-harry/log_auditor'
  spec.metadata['changelog_uri'] = 'https://github.com/the-harry/log_auditor/blob/master/CHANGELOG.md'
  spec.metadata = {
    'rubygems_mfa_required' => 'true'
  }

  spec.files = `git ls-files`.split($OUTPUT_RECORD_SEPARATOR)
  spec.bindir = 'bin'
  spec.executables = ['parser']
  spec.require_paths = ['lib']

  # spec.add_dependency "example-gem", "~> 1.0"

  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'simplecov'
end
