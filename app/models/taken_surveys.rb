class TakenSurvey < ActiveRecord::Base
  belongs_to :user
  belongs_to :survey  
end
