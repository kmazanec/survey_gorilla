class Option < ActiveRecord::Base
  belongs_to :question
  has_many :choices
end
