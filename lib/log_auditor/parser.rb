# frozen_string_literal: true

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
