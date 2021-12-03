# frozen_string_literal: true

require 'spec_helper'
require_relative '../support/shared_examples/errors'

RSpec.describe LogAuditor::Errors::FileReadError do
  include_examples 'error'
end
