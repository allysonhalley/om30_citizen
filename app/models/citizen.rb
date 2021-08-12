class Citizen < ApplicationRecord

	validates :name, presence: true, length: { minimum: 3 }
	validates :cpf, presence: true, uniqueness: true, length: { is: 11 }
	validates :cns, presence: true, uniqueness: true, length: { is: 14 }
	# validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP } 
	validates :email, email: {mode: :strict}
	
	validates :phone, presence: true, length: { is: 15 }
	validates :status, presence: true, length: { minimum: 5 }
	validate :valid_date
	# validate :valid_email


	def valid_date
		if birth_date.present?			
			unless birth_date.is_a?(Date)
				errors.add(:birth_date, "Is an invalid date!")
			end
			unless birth_date <= Date.today
				errors.add(:birth_date, "Age do not accept!")
			end
			
		end
	end

	# def valid_email
	# 	if email.present?
	# 		unless email.include?("@", ".") && email.include?(".") 
	# 			errors.add(:email, "Is an invalid email")
	# 		end
	# 	end		
	# end

end