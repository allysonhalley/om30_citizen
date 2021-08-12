require 'rails_helper'

def input_digits(length_digits)
	code = ""
	if length_digits > 0
		i = 0
		while length_digits > i do
			code = code+(rand(0..9).to_s)
			i += 1
		end
	end
	code
end


RSpec.describe Address, type: :model do
	citizen = Citizen.new(
		name: Faker::Name.name,
		cpf: input_digits(11),
		cns: input_digits(14),
		email: Faker::Internet.email,			
		birth_date: Faker::Date.birthday(min_age: 16, max_age: 120),
		phone: Faker::PhoneNumber.cell_phone,
		status: ApplicationHelper::STATUSES[:activated]
		)

	it "0 - Address is ok!" do
		address = Address.new(
			citizen: citizen,
			postcode: Faker::Address.postcode,
			street: Faker::Address.street_name,
			district: Faker::Address.street_name,
			city: Faker::Address.city,
			state: Faker::Address.state,
			complement: Faker::Address.secondary_address,
			ibge_code: input_digits(5)			
			)
		expect(address).to  be_valid
	end

end
