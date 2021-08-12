class Address < ApplicationRecord
	belongs_to :citizen

	validates :postcode, presence: true, length: {is: 9 }
	validates :street, presence: true, length: {minimum: 4 }
	validates :district, presence: true, length: {minimum:4 }
	validates :city, presence: true, length: {minimum:3 }
	# validates :state, presence: true, length: { minimum: 2 }
	validate :valid_state

	def valid_state
		if state.present?		
			unless ApplicationHelper::BR_STATES.value?(state)
				errors.add(:state, "is not brazilian state!")
			end
		else
			errors.add(:state, "haven't to be empty!")
		end
	end

end