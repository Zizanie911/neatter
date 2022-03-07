class CreateSessions < ActiveRecord::Migration[6.1]
  def change
    create_table :sessions do |t|
      t.date :today
      t.references :user, null: false, foreign_key: true
      t.boolean :passed

      t.timestamps
    end
  end
end
