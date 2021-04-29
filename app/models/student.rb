class Student < ApplicationRecord
  has_many :lessons
  has_many :tutors, through: :lessons
  has_secure_password

  validates :first_name, :last_name, :email, :username, presence: true 
  validates :email, :username, uniqueness: true 
end
