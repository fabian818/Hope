class Treatment < ActiveRecord::Base
	belongs_to :patient
	belongs_to :specialist
	has_many :visits
	validates :treatment_id, presence:{ message: "Es requerido"}
	validates :visit_type, presence:{ message: "Es requerido"}
end
