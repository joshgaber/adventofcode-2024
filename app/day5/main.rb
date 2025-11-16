require_relative 'page_order'

module Day5
  class Main
    def initialize(input)
      instructions, orders = input.split("\n\n")
      @instructions = PageOrder.new(instructions)
      @orders = orders.lines.map { |line| line.split(',').map(&:to_i) }
    end

    def part1
      matching = @orders.filter { |order| @instructions.matches?(order) }
      matching.sum { |arr| arr[arr.length / 2] }
    end

    def part2
      incorrect = @orders.reject { |order| @instructions.matches?(order) }

      incorrect.map! { |arr| @instructions.reorder(arr)[(arr.length - 1) / 2] }
      incorrect.sum
    end
  end
end
