# frozen_string_literal: true

class LogAuditor::Errors::NoFileError < RuntimeError
  DEFAULT_MESSAGE = 'File not found!'

  def initialize(msg = DEFAULT_MESSAGE)
    super(msg)
  end
end
