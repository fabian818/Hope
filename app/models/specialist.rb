class Specialist < ActiveRecord::Base
	belongs_to :person
	has_many :treatments
end
