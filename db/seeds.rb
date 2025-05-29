# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
#
# Création de 3 élèves avec leurs cours et rappels

Student.destroy_all

students = [
  { first_name: "Alice", last_name: "Dupont", permit_date: Date.new(2023, 5, 12) },
  { first_name: "Bob", last_name: "Martin", permit_date: nil },
  { first_name: "Chloé", last_name: "Durand", permit_date: Date.new(2024, 2, 20) }
]

students.each do |student_attrs|
  student = Student.create!(student_attrs)
  2.times do |i|
    lesson = student.lessons.create!(
      title: "Cours #{i + 1} de #{student.first_name}",
      date: Date.today + i,
      notes: "Notes du cours #{i + 1} pour #{student.first_name}"
    )
    lesson.reminders.create!(
      note: "Rappel pour le cours #{i + 1} de #{student.first_name}",
      date: Date.today + i + 1,
      success_rate: [nil, 50, 100].sample
    )
  end
end
