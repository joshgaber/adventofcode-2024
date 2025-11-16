# frozen_string_literal: true

module Day7
  class Calibration
    OPERATORS = %i[+ *].freeze

    attr_reader :target

    def initialize(input)
      @target, *@values = input.split(/[: ]+/).map(&:to_i)
    end

    def computable?(with_join: false)
      operators = with_join ? [*OPERATORS, :|] : OPERATORS
      operators.repeated_permutation(@values.length).any? do |perm|
        total = @values.reduce do |acc, elem|
          case perm.pop
          when :+ then acc + elem
          when :* then acc * elem
          when :| then "#{acc}#{elem}".to_i
          end
        end
        total == @target
      end
    end
  end
end
