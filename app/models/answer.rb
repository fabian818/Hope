class Answer < ActiveRecord::Base
	belongs_to :person
	belongs_to :question
end
