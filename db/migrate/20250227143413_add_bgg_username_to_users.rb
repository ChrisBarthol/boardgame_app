class AddBggUsernameToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :bgg_username, :string
  end
end
