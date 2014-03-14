class Person < ActiveRecord::Base
	has_one :patient
	has_one :specialist
	validates :login, presence:{ message: "Es requerido"}, uniqueness: {message: "Login en uso"} , length: { in: 5..12 }
	validates :password, presence: { message: "Es requerido"}, length: { in: 5..12 }
	validates :name, presence: { message: "Es requerido"}
	validates :paternal_last, presence: { message: "Es requerido"}
	validates :state, presence: { message: "Es requerido"}
	validates :permission, presence: { message: "Es requerido"} 
end
