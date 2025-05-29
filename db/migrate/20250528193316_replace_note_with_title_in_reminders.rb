class ReplaceNoteWithTitleInReminders < ActiveRecord::Migration[8.0]
  def change
    remove_column :reminders, :note, :text
    add_column :reminders, :title, :string
  end
end
