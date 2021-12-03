# frozen_string_literal: true

require 'log_auditor'
require 'pry'
require 'simplecov'

SimpleCov.start do
  add_filter '/.github'
  add_filter '/bin'
  add_filter '/coverage'
  add_filter '/pkg'
end

SimpleCov.minimum_coverage 99

RSpec.configure do |config|
  config.example_status_persistence_file_path = '.rspec_status'
  config.disable_monkey_patching!
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

require File.join(Dir.pwd, '/spec/support/shared_examples/errors')
