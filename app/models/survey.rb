class Survey < ActiveRecord::Base
  belongs_to :creator, class_name: "User"
  has_many :questions
  has_many :taken_surveys
  has_many :takers, through: :taken_surveys
  validates :name, presence: true
  validate :one_question

 def one_question
   errors.add(:questions,": the survey must have at least one question!") if self.questions.length < 1
 end 



end
