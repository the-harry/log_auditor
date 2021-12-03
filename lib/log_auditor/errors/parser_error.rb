# frozen_string_literal: true

class LogAuditor::Errors::ParseError < RuntimeError
  DEFAULT_MESSAGE = 'Error parsing log data!'

  def initialize(msg = DEFAULT_MESSAGE)
    super(msg)
  end
end
