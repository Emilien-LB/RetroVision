class Lesson < ApplicationRecord
  belongs_to :student
  has_many :reminders, dependent: :destroy
end
