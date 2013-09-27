class Question < ActiveRecord::Base
  belongs_to :survey
  has_many :options
  has_many :choices, through: :options
end
