# frozen_string_literal: true

require 'spec_helper'
require_relative '../support/shared_examples/errors'

RSpec.describe LogAuditor::Errors::NoFileError do
  include_examples 'error'
end
