# frozen_string_literal: true

module Day5
  class PageOrder
    Instruction = Data.define(:first, :second)

    attr_reader :page_order, :instructions

    def initialize(input)
      @instructions = input.lines(chomp: true).to_set { |rule| rule.split('|').map(&:to_i) }
    end

    def matches?(list)
      list.combination(2).all? { |combo| @instructions.include?(combo) }
    end

    def reorder(list)
      index_map = list.each_index.to_a.combination(2)
      list = list.dup
      loop do
        break if catch(:sorted) do
          index_map.each do |i, j|
            next unless @instructions.include?([list[j], list[i]])

            list[i], list[j] = list[j], list[i]
            throw :sorted, false
          end

          true
        end
      end
      list
    end
  end
end
