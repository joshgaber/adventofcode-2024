# frozen_string_literal: true

require_relative 'multiplier'

module Day3
  class Main
    DO_DONT_MATCH = /do(?:n't)?\(\)/

    def initialize(input)
      @input = input.lines.join
    end

    def part1
      multipliers = Multiplier.list_from_string(@input)
      multipliers.sum(&:product)
    end

    def part2
      multipliers = []
      remaining = @input
      loop do
        remaining, part, suffix = remaining.rpartition(DO_DONT_MATCH)
        multipliers.concat(Multiplier.list_from_string(suffix)) if part != "don't()"
        break if remaining.empty?
      end
      multipliers.sum(&:product)
    end
  end
end
