# frozen_string_literal: true

module Day1
  class Main
    def initialize(input)
      @first_list = []
      @second_list = []
      input.lines.each do |line|
        first, second = line.strip.split(/\s+/).map(&:to_i)
        @first_list << first
        @second_list << second
      end
    end

    def part1
      first_list_sorted = @first_list.sort
      second_list_sorted = @second_list.sort

      (0...first_list_sorted.length).sum do |i|
        (first_list_sorted[i] - second_list_sorted[i]).abs
      end
    end

    def part2
      second_list_count = @second_list.group_by { _1 }
      second_list_count.transform_values!(&:count)

      @first_list.sum do |elem|
        elem * (second_list_count[elem] || 0)
      end
    end
  end
end
