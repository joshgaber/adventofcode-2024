# frozen_string_literal: true

module Day6
  class Grid
    OBSTACLE = '#'
    CLEAR = '.'

    def initialize(input)
      @grid = input.tr('^', '.').lines(chomp: true).map(&:chars)
      @yrange = (0...@grid.length)
      @xrange = (0...@grid[0].length)
    end

    def [](y, x)
      return unless in_bounds?(y, x)

      @grid.dig(y, x)
    end

    def in_bounds?(y, x)
      @yrange.cover?(y) && @xrange.cover?(x)
    end

    def add_obstacle!(y, x)
      raise 'invalid space' unless in_bounds?(y, x)

      @grid[y][x] = OBSTACLE
    end

    def remove_obstacle!(y, x)
      raise 'invalid space' unless in_bounds?(y, x)

      @grid[y][x] = CLEAR
    end
  end
end
