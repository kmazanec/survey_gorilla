class TakenSurvey < ActiveRecord::Base
  belongs_to :taker, class_name: "User"
  belongs_to :survey  
  has_one :creator, through: :survey
  has_many :choices
  
  validate :survey_complete
  validate :one_submission
  

  def survey_complete
     errors.add(:surveys,"The survey must be complete!") if self.choices.length != self.survey.questions.length
  end

  def one_submission
    if TakenSurvey.find_by(taker: self.taker, survey: self.survey) 
      errors.add(:taken_surveys, "You've already taken this survey.")
    else
      true
    end
  end

end
