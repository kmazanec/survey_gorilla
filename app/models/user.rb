require 'bcrypt'

class User < ActiveRecord::Base
  has_many :created_surveys, class_name: "Survey", foreign_key: :creator_id
  has_many :taken_surveys, class_name: "TakenSurvey", foreign_key: :taker_id

  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true

  include BCrypt

  has_secure_password


  def password
    @password ||= Password.new(password_digest)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_digest = @password
  end


end
