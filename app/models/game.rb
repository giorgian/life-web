require 'life'

class Game < ApplicationRecord
  belongs_to :user

  def to_generation
    @generation ||= Life::Generation.new(generation, width, height, JSON.parse(grid))
  end

  def next_step!
    gen = to_generation.next_step
    self.generation += 1
    self.grid = gen.grid.to_json
    save!
  end

  def reset!
    self.generation = 1
    self.grid = initial_grid
    save!
  end

  class << self
    def from_string(content, user)
      game = Life::Importer.new.import(content)
      grid = game.grid.to_json
      user.games.create(generation: game.number, width: game.width, height: game.height, grid: grid, initial_grid: grid)
    rescue Life::Error
      nil
    end
  end
end
