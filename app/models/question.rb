class Question < ActiveRecord::Base
	belongs_to :person
	belongs_to :patient
	has_many :answers
end
