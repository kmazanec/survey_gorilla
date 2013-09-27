class TakenSurvey < ActiveRecord::Base
  belongs_to :taker, class_name: "User"
  belongs_to :survey  
  has_one :creator, through: :survey
end
