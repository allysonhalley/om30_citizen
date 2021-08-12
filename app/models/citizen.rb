class Citizen < ApplicationRecord
	
	validates :name, presence: true, length: { minimum: 3 }
	validates :cpf, presence: true, uniqueness: true, length: { is: 11 }
	validates :cns, presence: true, uniqueness: true, length: { is: 14 }
	validates :email, email: {mode: :strict}
	validates :phone, presence: true, length: { is: 15 }
	validate :valid_status
	validate :valid_date
	
	def valid_date
		if birth_date.present?			
			unless birth_date.is_a?(Date)
				errors.add(:birth_date, "Is an invalid date!")
			end
			if birth_date > (Date.today - 18.year) || birth_date == Date.today
				errors.add(:birth_date, "do not accept!")
			end			
		else
			errors.add(:birth_date, "haven't to be empty!")
		end
	end

	def valid_status
		if status.present?			
			unless ApplicationHelper::STATUSES.value?(status)
				errors.add(:status, "is not supported!")
			end
		else
			errors.add(:status, "haven't to be empty!")
		end
	end


end