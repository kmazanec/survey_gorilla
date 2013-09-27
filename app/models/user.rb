class User < ActiveRecord::Base
  has_many :created_surveys, class_name: "Survey", foreign_key: :creator_id
  has_many :taken_surveys, class_name: "TakenSurvey", foreign_key: :taker_id
end
