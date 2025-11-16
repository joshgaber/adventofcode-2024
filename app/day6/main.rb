# frozen_string_literal: true

require_relative 'grid'
require_relative 'guard'

module Day6
  class Main
    def initialize(input)
      @input = input
    end

    def part1
      grid = Grid.new(@input)
      guard = Guard.new(@input, grid)
      guard.leave_grid!
    end

    def part2
      grid = Grid.new(@input)
      guard = Guard.new(@input, grid)
      all_positions = (0...@input.lines.count).to_a.product((0...@input[/^\S+/].length).to_a)
      all_positions.count do |(y, x)|
        next false if grid[y, x] == Grid::OBSTACLE

        grid.add_obstacle!(y, x)
        guard.leave_grid!
        grid.remove_obstacle!(y, x)

        false
      rescue Guard::InfiniteLoopException
        grid.remove_obstacle!(y, x)
        true
      end
    end
  end
end
