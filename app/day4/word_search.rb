module Day4
  class WordSearch
    SEARCH_DIRECTIONS = [[-1, -1], [-1, 0], [-1, 1], [0, -1], [0, 1], [1, -1], [1, 0], [1, 1]].freeze
    XMAS = [[-1, -1], [-1, 0], [-1, 1], [0, -1], [0, 1], [1, -1], [1, 0], [1, 1]].freeze

    def initialize(body)
      @body = body.lines.map(&:chars)
    end

    def count(word)
      @body.flat_map.with_index do |line, row|
        line.map.with_index { |_, col| occurrences_at(word, row, col) }
      end.sum
    end

    def x_mas_count
      @body.map.with_index do |line, row|
        line.select.with_index { |_, col| x_mas_at(row, col) }.count
      end.sum
    end

    def occurrences_at(word, row, col)
      return 0 unless word.start_with?(self[row, col])

      word_range = 0...word.length

      SEARCH_DIRECTIONS.count do |(ydir, xdir)|
        positions = word_range.map { |index| [row + (ydir * index), col + (xdir * index)] }

        positions.map { |(x, y)| self[x, y] }.join == word
      rescue ArgumentError
        false
      end
    end

    def x_mas_at(row, col)
      return false unless self[row, col] == 'A'

      [
        "#{self[row + 1, col + 1]}#{self[row, col]}#{self[row - 1, col - 1]}",
        "#{self[row + 1, col - 1]}#{self[row, col]}#{self[row - 1, col + 1]}"
      ].all? { |str| %w[MAS SAM].include?(str) }
    rescue ArgumentError
      false
    end

    def [](row, col)
      raise ArgumentError, '`row` is out of range' unless row >= 0 && row < @body.length
      raise ArgumentError, '`col` is out of range' unless col >= 0 && row < @body.first.length

      @body[row][col]
    end
  end
end