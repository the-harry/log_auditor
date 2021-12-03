# frozen_string_literal: true

require 'colorize'
require 'terminal-table'

class LogAuditor::Presenter
  attr_reader :requests, :uniq_requests

  def initialize(data)
    @requests = data[:requests]
    @uniq_requests = data[:uniq_requests]
  end

  def present!
    puts requests_table
    puts '=' * 72
    puts uniq_requests_table
  end

  private

  def requests_table
    Terminal::Table.new(
      title: 'Requests counter'.colorize(:green),
      headings: ['PATH'.colorize(:blue), 'COUNTER'.colorize(:blue)],
      rows: requests.map do |request|
        [
          request[:path].colorize(:green),
          "#{request[:counter]} visits".colorize(:green)
        ]
      end
    )
  end

  def uniq_requests_table
    Terminal::Table.new(
      title: 'Uniq requests counter'.colorize(:yellow),
      headings: ['PATH'.colorize(:blue), 'COUNTER'.colorize(:blue)],
      rows: uniq_requests.map do |request|
        [
          request[:path].colorize(:yellow),
          "#{request[:uniq_counter]} unique views".colorize(:yellow)
        ]
      end
    )
  end
end
