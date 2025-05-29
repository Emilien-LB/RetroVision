class CreateLessons < ActiveRecord::Migration[8.0]
  def change
    create_table :lessons do |t|
      t.references :student, null: false, foreign_key: true
      t.string :title
      t.date :date
      t.text :notes

      t.timestamps
    end
  end
end
