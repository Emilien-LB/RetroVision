class CreateStudents < ActiveRecord::Migration[8.0]
  def change
    create_table :students do |t|
      t.string :first_name
      t.string :last_name
      t.string :gearbox_type
      t.date :permit_date
      t.string :result
      t.boolean :archived

      t.timestamps
    end
  end
end
