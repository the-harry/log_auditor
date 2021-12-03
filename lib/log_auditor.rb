# frozen_string_literal: true

require_relative 'log_auditor/version'
require_relative 'log_auditor/errors'
require_relative 'log_auditor/reader'
require_relative 'log_auditor/formatter'
require_relative 'log_auditor/presenter'

class LogAuditor::Parser
  attr_reader :reader, :formatter, :presenter

  def initialize(reader:, formatter:, presenter:)
    @reader = reader
    @formatter = formatter
    @presenter = presenter
  end

  def parse!
    raw_data = reader.read!
    formatted_data = formatter.new(raw_data).format!
    presenter.new(formatted_data).present!
  end
end
