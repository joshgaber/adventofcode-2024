# frozen_string_literal: true

module Day3
  class Multiplier
    MUL_MATCH = /mul\((\d{1,3}),(\d{1,3})\)/
    NUM_MATCH = /\d+/

    def initialize(*args)
      @numbers = args.map(&:to_i)
    end

    def product = @numbers.inject(:*)

    class << self
      def list_from_string(line)
        line.scan(MUL_MATCH).map { |match| new(*match) }
      end
    end
  end
end
