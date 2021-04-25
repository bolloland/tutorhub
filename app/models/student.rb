class Student < ApplicationRecord
  # has_many :lessons
  # has_many :tutors, through: :lessons
  has_secure_password
end
