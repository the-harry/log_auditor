# frozen_string_literal: true

require 'colorize'

class LogAuditor::Errors::ParseError < RuntimeError
  DEFAULT_MESSAGE = 'Error parsing log data!'.colorize(:red)

  def initialize(msg = DEFAULT_MESSAGE)
    super(msg)
  end
end
