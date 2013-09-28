class Choice < ActiveRecord::Base
  belongs_to :option
  has_one :question, through: :option
  belongs_to :taken_survey
  has_one :taker, through: :taken_survey

  # validate :one_per_question

  # def one_per_question
  #   # IF a choice exists with the given option_id and taken_survey_id
  #     # NO
  #   # ELSE
  #     # YES
  #   choice = Choice.find_by(option: self.option)

  #   if Choice.find_by(taker: self.taker, question: self.question) 
  #     errors.add(:taken_surveys, "You've already taken this survey.")
  #   else
  #     true
  #   end
  # end

end
