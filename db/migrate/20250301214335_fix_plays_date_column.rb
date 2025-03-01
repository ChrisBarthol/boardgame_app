class FixPlaysDateColumn < ActiveRecord::Migration[7.1]
  def change
    rename_column :plays, :data, :date
  end
end
