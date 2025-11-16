# frozen_string_literal: true

require_relative 'report'

module Day2
  class Main
    def initialize(input)
      @reports =
        input.lines.map do |line|
          Report.new(line)
        end
    end

    def part1
      @reports.count(&:within_threshold?)
    end

    def part2
      @reports.count do |report|
        next true if report.within_threshold?

        (0...report.length).any? { |index| report.without(index).within_threshold? }
      end
    end
  end
end
