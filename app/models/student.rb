class Student < ApplicationRecord
  has_many :professor_students, dependent: :destroy
  has_many :professors, through: :professor_students
  validates_presence_of :name
end
