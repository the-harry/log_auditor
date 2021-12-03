# frozen_string_literal: true

require 'colorize'

class LogAuditor::Errors::FileReadError < RuntimeError
  DEFAULT_MESSAGE = 'Can\'t read file!'.colorize(:red)

  def initialize(msg = DEFAULT_MESSAGE)
    super(msg)
  end
end
