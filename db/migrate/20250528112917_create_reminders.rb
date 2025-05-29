class CreateReminders < ActiveRecord::Migration[8.0]
  def change
    create_table :reminders do |t|
      t.references :lesson, null: false, foreign_key: true
      t.date :date
      t.text :note
      t.integer :success_rate

      t.timestamps
    end
  end
end
