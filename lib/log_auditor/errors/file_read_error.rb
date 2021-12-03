# frozen_string_literal: true

class LogAuditor::Errors::FileReadError < RuntimeError
  DEFAULT_MESSAGE = 'Can\'t read file!'

  def initialize(msg = DEFAULT_MESSAGE)
    super(msg)
  end
end
