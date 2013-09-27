class Choice < ActiveRecord::Base
  belongs_to :question, through: :options
  belongs_to :option
  belongs_to :taken_survey
  belongs_to :user, through: :taken_survey
end
