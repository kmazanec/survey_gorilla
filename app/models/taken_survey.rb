class TakenSurvey < ActiveRecord::Base
  belongs_to :taker, class_name: "User"
  belongs_to :survey  
  has_one :creator, through: :survey
  has_many :choices
  
  validates :name, presence: true
  validate :survey_complete

  def survey_complete
     errors.add(:surveys,"The survey must be complete!") if self.choices.length != self.survey.questions.length
  end

end
