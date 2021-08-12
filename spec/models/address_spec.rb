require 'rails_helper'

RSpec.describe Address, type: :model do
	### Use this block when u database is blank ###
	# citizen = Citizen.new(
	# 	name: Faker::Name.name,
	# 	cpf: code_string_generator(11),
	# 	cns: code_string_generator(14),
	# 	email: Faker::Internet.email,			
	# 	birth_date: Faker::Date.birthday(min_age: 16, max_age: 120),
	# 	phone: Faker::PhoneNumber.cell_phone,
	# 	status: ApplicationHelper::STATUSES[:activated]
	# 	)

	it "0 - Address is ok!" do
		address = Address.new(
			citizen: Citizen.find(Citizen.ids.sample),
			postcode: Faker::Address.postcode,
			street: Faker::Address.street_name,
			district: Faker::Address.street_name,
			city: Faker::Address.city,
			state: Faker::Address.state,
			complement: Faker::Address.secondary_address,
			ibge_code: ApplicationHelper::code_string_generator(5)			
			)
		expect(address).to  be_valid
	end

	it "1 - Citizen is not null!" do
		address = Address.new(
			citizen: nil,
			postcode: Faker::Address.postcode,
			street: Faker::Address.street_name,
			district: Faker::Address.street_name,
			city: Faker::Address.city,
			state: Faker::Address.state,
			complement: Faker::Address.secondary_address,
			ibge_code: code_string_generator(5)			
			)
		expect(address).to  be_valid
	end

	it "2 - Postcode is not null!" do
		address = Address.new(
			citizen: Citizen.find(Citizen.ids.sample),
			postcode: "",
			street: Faker::Address.street_name,
			district: Faker::Address.street_name,
			city: Faker::Address.city,
			state: Faker::Address.state,
			complement: Faker::Address.secondary_address,
			ibge_code: code_string_generator(5)			
			)
		expect(address).to  be_valid
	end

	it "3 - Postcode is too short!" do
		address = Address.new(
			citizen: Citizen.find(Citizen.ids.sample),
			postcode: ApplicationHelper::code_string_generator(5),
			street: Faker::Address.street_name,
			district: Faker::Address.street_name,
			city: Faker::Address.city,
			state: Faker::Address.state,
			complement: Faker::Address.secondary_address,
			ibge_code: ApplicationHelper::code_string_generator(5)			
			)
		expect(address).to  be_valid
	end

	it "4 - Street is not null!" do
		address = Address.new(
			citizen: Citizen.find(Citizen.ids.sample),
			postcode: Faker::Address.postcode,
			street: "",
			district: Faker::Address.street_name,
			city: Faker::Address.city,
			state: Faker::Address.state,
			complement: Faker::Address.secondary_address,
			ibge_code: ApplicationHelper::code_string_generator(5)			
			)
		expect(address).to  be_valid
	end

	it "5 - Street is too short!" do
		address = Address.new(
			citizen: Citizen.find(Citizen.ids.sample),
			postcode: Faker::Address.postcode,
			street: "So",
			district: Faker::Address.street_name,
			city: Faker::Address.city,
			state: Faker::Address.state,
			complement: Faker::Address.secondary_address,
			ibge_code: ApplicationHelper::code_string_generator(5)			
			)
		expect(address).to  be_valid
	end

	it "6 - District is not null!" do
		address = Address.new(
			citizen: Citizen.find(Citizen.ids.sample),
			postcode: Faker::Address.postcode,
			street: Faker::Address.street_name,
			district: "",
			city: Faker::Address.city,
			state: Faker::Address.state,
			complement: Faker::Address.secondary_address,
			ibge_code: ApplicationHelper::code_string_generator(5)			
			)
		expect(address).to  be_valid
	end

	it "7 - Distric name is too short, not valid!" do
		address = Address.new(
			citizen: Citizen.find(Citizen.ids.sample),
			postcode: Faker::Address.postcode,
			street: Faker::Address.street_name,
			district: "So",
			city: Faker::Address.city,
			state: Faker::Address.state,
			complement: Faker::Address.secondary_address,
			ibge_code: ApplicationHelper::code_string_generator(5)			
			)
		expect(address).to  be_valid
	end

	it "8 - City is not null!" do
		address = Address.new(
			citizen: Citizen.find(Citizen.ids.sample),
			postcode: Faker::Address.postcode,
			street: Faker::Address.street_name,
			district: Faker::Address.street_name,
			city: "",
			state: Faker::Address.state,
			complement: Faker::Address.secondary_address,
			ibge_code: ApplicationHelper::code_string_generator(5)			
			)
		expect(address).to  be_valid
	end

	it "9 - City is to short!" do
		address = Address.new(
			citizen: Citizen.find(Citizen.ids.sample),
			postcode: Faker::Address.postcode,
			street: Faker::Address.street_name,
			district: Faker::Address.street_name,
			city: "So",
			state: Faker::Address.state,
			complement: Faker::Address.secondary_address,
			ibge_code: ApplicationHelper::code_string_generator(5)			
			)
		expect(address).to  be_valid
	end

	it "0 - Stete is not null!" do
		address = Address.new(
			citizen: Citizen.find(Citizen.ids.sample),
			postcode: Faker::Address.postcode,
			street: Faker::Address.street_name,
			district: Faker::Address.street_name,
			city: Faker::Address.city,
			state: Faker::Address.state,
			complement: Faker::Address.secondary_address,
			ibge_code: ApplicationHelper::code_string_generator(5)			
			)
		expect(address).to  be_valid
	end

	it "10 - State is too short!" do
		address = Address.new(
			citizen: Citizen.find(Citizen.ids.sample),
			postcode: Faker::Address.postcode,
			street: Faker::Address.street_name,
			district: Faker::Address.street_name,
			city: Faker::Address.city,
			state: "SO",
			complement: Faker::Address.secondary_address,
			ibge_code: ApplicationHelper::code_string_generator(5)			
			)
		expect(address).to  be_valid
	end
	
end
