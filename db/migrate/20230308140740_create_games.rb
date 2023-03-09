class CreateGames < ActiveRecord::Migration[7.0]
  def change
    create_table :games do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :generation
      t.integer :width
      t.integer :height
      t.text :grid
      t.text :initial_grid
      t.timestamps
    end
  end
end
