class Citizen < ApplicationRecord

	validates :name, presence: true, length: { minimum: 3 }
	validates :cpf, presence: true, uniqueness: true, length: { is: 11 }
	validates :cns, presence: true, uniqueness: true, length: { is: 14 }
	validates :email, email: {mode: :strict}
	validates :phone, presence: true, length: { is: 15 }
	validates :status, presence: true, length: { minimum: 5 }
	# validates :birth_date, before: { 18.years.ago }
	validate :valid_date
	


	def valid_date
		if birth_date.present?			
			unless birth_date.is_a?(Date)
				errors.add(:birth_date, "Is an invalid date!")
			end
			if birth_date > (Date.today - 18.year) || birth_date == Date.today
				errors.add(:birth_date, "Age do not accept!")
			end			
		else
			errors.add(:birth_date, "Birth Date haven't to be empty!")
		end

	end


end