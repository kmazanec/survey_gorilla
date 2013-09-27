class Choice < ActiveRecord::Base
  belongs_to :option
  has_one :question, through: :option
  belongs_to :taken_survey
  has_one :taker, through: :taken_survey
end
