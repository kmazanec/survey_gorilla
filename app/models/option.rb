class Option < ActiveRecord::Base
  belongs_to :question
  has_many :choices
  

  validates :text, presence: true
end
