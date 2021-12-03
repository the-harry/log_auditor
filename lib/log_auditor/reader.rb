# frozen_string_literal: true

require_relative 'errors'

class LogAuditor::Reader
  attr_reader :log_file
  attr_accessor :data

  def initialize(log_file)
    @log_file = log_file
    @data = []
  end

  def read!
    raise LogAuditor::Errors::NoFileError unless File.exist?(log_file)

    @data = fetch_content
  rescue Errno, TypeError => e
    puts "Error #{e.message}"
    raise LogAuditor::Errors::FileReadError
  end

  private

  def fetch_content
    File.read(log_file).split("\n").map { |line| line.split(/\s/) }
  end
end
