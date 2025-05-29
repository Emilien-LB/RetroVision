class Student < ApplicationRecord
  has_many :lessons, dependent: :destroy
  has_many :reminders, through: :lessons
end
