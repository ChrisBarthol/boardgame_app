class CreateGames < ActiveRecord::Migration[7.1]
  def change
    create_table :games do |t|
      t.string :name
      t.integer :bgg_id
      t.integer :year
      t.string :image

      t.timestamps
    end
  end
end
