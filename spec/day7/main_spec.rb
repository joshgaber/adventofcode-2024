require 'rspec'
require_relative '../spec_helper'
require_relative '../../app/day7/main'

describe Day7::Main do
  let(:input) { File.read('./app/day7/input.txt').strip }

  describe 'part 1' do
    include_examples 'part1', 'Enter your result here'
  end

  describe 'part 2' do
    include_examples 'part2', 'Enter your result here'
  end
end
