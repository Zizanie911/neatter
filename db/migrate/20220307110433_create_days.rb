class CreateDays < ActiveRecord::Migration[6.1]
  def change
    create_table :days do |t|
      t.datetime :today, null: false, default: Date.today
      t.boolean :passed, default: false

      t.timestamps
    end
  end
end
