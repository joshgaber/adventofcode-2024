# frozen_string_literal: true

module Day6
  class Guard
    UP = [-1, 0].freeze
    RIGHT = [0, 1].freeze
    DOWN = [1, 0].freeze
    LEFT = [0, -1].freeze

    class InfiniteLoopException < StandardError; end

    def initialize(input, grid)
      @grid = grid
      input = input.lines(chomp: true)
      row = input.index { |a| a.include?('^') }
      col = input[row].index('^')
      @initial_position = [row, col]
      reset_position!
    end

    def leave_grid!
      reset_position!
      steps = Set[@position]
      step_and_position = Set[[*@position, *@direction]]
      loop do
        move!
        break unless in_bounds?

        steps.add(@position)
        raise InfiniteLoopException if step_and_position.include?([*@position, *@direction])

        step_and_position.add([*@position, *@direction])
      end
      steps.count
    end

    private

    def next_position = [@position[0] + @direction[0], @position[1] + @direction[1]]
    def front = @grid[*next_position]
    def in_bounds? = @grid.in_bounds?(*@position)

    def move!
      rotate! while front == Grid::OBSTACLE
      step!
    end

    def step!
      @position = next_position
    end

    def rotate!
      @direction = case @direction
                   when UP then RIGHT
                   when RIGHT then DOWN
                   when DOWN then LEFT
                   else UP
                   end
    end

    def reset_position!
      @direction = UP
      @position = @initial_position.dup
    end
  end
end
