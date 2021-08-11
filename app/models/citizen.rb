class Citizen < ApplicationRecord

	validates :name, presence: true
	validates :cpf, presence: true, uniqueness: true, length: { is: 11 }
	validates :cns, presence: true, uniqueness: true
	validates :email, presence: true, uniqueness: true	
	validates :phone, presence: true, length: { is: 15 }
	validates :status, presence: true, length: { minimum: 5 }
	validate :valid_date


	def valid_date
		if birth_date.present?			
			unless birth_date.is_a?(Date)
				errors.add(:birth_date, "Is an invalid date!")
			end
			unless birth_date < Date.today
				errors.add(:birth_date, "Age do not accept!")
			end
			
		end
	end

end