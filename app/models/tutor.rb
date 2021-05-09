class Tutor < ApplicationRecord
  has_many :lessons
  has_many :students, through: :lessons
  has_secure_password

  validates :first_name, :last_name, :email, :username, presence: true 
  validates :email, :username, uniqueness: true 
  validates :password, length: {minimum: 7}, allow_nil: true

  scope :alpha_by_subject_taught, -> {order('subject_taught')}
  scope :order_by_years_exp, -> {order('years_exp')}


  def self.from_omniauth(response)
    
    Tutor.find_or_create_by(uid: response[:uid], provider: response[:provider]) do |x|
        x.username = response[:info][:first_name]
        x.first_name = response[:info][:first_name]
        x.last_name = response[:info][:last_name]
        x.email = response[:info][:email]
        x.password = SecureRandom.hex(15)
    end
  end 
end
