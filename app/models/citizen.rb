class Citizen < ApplicationRecord

	validates :name, presence: true
	validates :cpf, presence: true, unique: true, length: { is: 11 }
	validates :cns, presence: true, unique: true
	validates :email, presence: true, unique: true
	validates :birth_date, presence: true, comparison: {less_than: Date.today}
	validates :phone, presence: true, length: { is: 13 }
	validates :status, presence: true, length: { min: 5 }

end