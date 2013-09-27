class Question < ActiveRecord::Base

  belongs_to :survey
  has_many :options
  has_many :choices, through: :options

  validates :text, presence: true
  validate :two_options


    def two_options
      if self.options.length < 2
        errors.add(:options, "Question must have at least two options!") 
      end
    end  
    

end
