# frozen_string_literal: true

require 'colorize'

class LogAuditor::Errors::NoFileError < RuntimeError
  DEFAULT_MESSAGE = 'File not found!'.colorize(:red)

  def initialize(msg = DEFAULT_MESSAGE)
    super(msg)
  end
end
