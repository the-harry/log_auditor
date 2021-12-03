# frozen_string_literal: true

require_relative 'errors'

class LogAuditor::Formatter
  attr_reader :raw_data
  attr_accessor :requests, :uniq_requests

  def initialize(data)
    @raw_data = data
    @requests = []
    @uniq_requests = []
  end

  def format!
    requests = sort_by(:counter)
    uniq_requests = sort_by(:uniq_counter)

    { requests: requests, uniq_requests: uniq_requests }
  rescue StandardError
    raise LogAuditor::Errors::ParseError
  end

  private

  def sort_by(counter_type)
    grouped_logs.sort_by { |key| key[counter_type] }.reverse
  end

  def grouped_logs
    @grouped_logs ||= raw_data.group_by(&:first)
                              .map { |key, values| build_hash(key, values) }
  end

  def build_hash(key, values)
    {
      path: key,
      counter: requests_counter(values),
      uniq_counter: uniq_requests_counter(values)
    }
  end

  def requests_counter(ips)
    ips.flatten.count
  end

  def uniq_requests_counter(ips)
    ips.flatten.uniq.count
  end
end
