class CreateDays < ActiveRecord::Migration[6.1]
  def change
    create_table :days do |t|
      t.references :user, null: false, foreign_key: true
      t.date :today, null: false
      t.boolean :passed, default: false

      t.timestamps
    end
  end
end
