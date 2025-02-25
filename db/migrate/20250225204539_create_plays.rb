class CreatePlays < ActiveRecord::Migration[7.1]
  def change
    create_table :plays do |t|
      t.references :game, null: false, foreign_key: true
      t.date :data
      t.integer :quantity

      t.timestamps
    end
  end
end
