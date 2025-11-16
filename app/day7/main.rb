# frozen_string_literal: true

require_relative 'calibration'

module Day7
  class Main
    def initialize(input)
      @calibrations = input.lines(chomp: true).map { |line| Calibration.new(line) }
    end

    def part1
      @calibrations.filter(&:computable?).sum(&:target)
    end

    def part2
      @calibrations.filter { |cal| cal.computable?(with_join: true) }.sum(&:target)
    end
  end
end
