require_relative 'word_search'

module Day4
  class Main
    def initialize(input)
      @word_search = WordSearch.new(input)
    end

    def part1
      @word_search.count('XMAS')
    end

    def part2
      @word_search.x_mas_count
    end
  end
end
