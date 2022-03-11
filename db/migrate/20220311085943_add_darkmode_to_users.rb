class AddDarkmodeToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :dark_mode, :boolean, default: true
  end
end
