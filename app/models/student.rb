class Student < ApplicationRecord
  has_many :lessons
  has_many :tutors, through: :lessons
  has_secure_password

  validates :first_name, :last_name, :email, :username, presence: true 
  validates :email, :username, uniqueness: true 

  scope :alpha_by_subject, -> {order('subject_help')}
  scope :order_by_grade, -> {order('grade')}

  # def self.from_omniauth(response)
  #   Student.find_or_create_by(uid: response[:uid], provider: response[:provider]) do |x|
  #       x.username = response[:info][:name]
  #       x.email = response[:info][:email]
  #       x.password = SecureRandom.hex(15)
  #   end
  # end
end
