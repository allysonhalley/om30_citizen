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


describe Citizen do
	
	it "0 - Citizen is ok!" do
		citizen = Citizen.new(
			name: Faker::Name.name,
			cpf: input_digits(11),
			cns: input_digits(14),
			email: Faker::Internet.email,			
			birth_date: Faker::Date.birthday(min_age: 16, max_age: 120),
			phone: Faker::PhoneNumber.cell_phone,
			status: ApplicationHelper::STATUSES[:activated]
			)
		expect(citizen).to  be_valid
	end

	it "1 - Name can't be empty!" do
		citizen = Citizen.new(
			name: "",
			cpf: input_digits(11),
			cns: input_digits(14),
			email: Faker::Internet.email,
			birth_date: Faker::Date.birthday(min_age: 16, max_age: 120),
			phone: Faker::PhoneNumber.cell_phone,
			status: ApplicationHelper::STATUSES[:activated]
			)

		expect(citizen).to  be_valid
	end

	it "2 - Name can't be so short!" do
		citizen = Citizen.new(
			name: "AB",
			cpf: input_digits(11),
			cns: input_digits(14),
			email: Faker::Internet.email,
			birth_date: Faker::Date.birthday(min_age: 16, max_age: 120),
			phone: Faker::PhoneNumber.cell_phone,
			status: ApplicationHelper::STATUSES[:activated]
			)

		expect(citizen).to  be_valid
	end

	it "3 - CPF is not empty!" do
		citizen = Citizen.new(
			name: Faker::Name.name,
			cpf: "",
			cns: input_digits(14),
			email: Faker::Internet.email,
			birth_date: Faker::Date.birthday(min_age: 16, max_age: 120),
			phone: Faker::PhoneNumber.cell_phone,
			status: ApplicationHelper::STATUSES[:activated]
			)

		expect(citizen).to  be_valid
	end

	it "4 - CPF length must be 11!" do
		citizen = Citizen.new(
			name: Faker::Name.name,
			cpf: input_digits(9),
			cns: input_digits(14),
			email: Faker::Internet.email,
			birth_date: Faker::Date.birthday(min_age: 16, max_age: 120),
			phone: Faker::PhoneNumber.cell_phone,
			status: ApplicationHelper::STATUSES[:activated]
			)

		expect(citizen).to  be_valid
	end

	it "5 - CNS is not empty!" do
		citizen = Citizen.new(
			name: Faker::Name.name,
			cpf: input_digits(11),
			cns: input_digits(0),
			email: Faker::Internet.email,
			birth_date: Faker::Date.birthday(min_age: 16, max_age: 120),
			phone: Faker::PhoneNumber.cell_phone,
			status: ApplicationHelper::STATUSES[:activated]
			)

		expect(citizen).to  be_valid
	end

	it "6 - CPF is not empty!" do
		citizen = Citizen.new(
			name: Faker::Name.name,
			cpf: input_digits(11),
			cns: input_digits(11),
			email: Faker::Internet.email,
			birth_date: Faker::Date.birthday(min_age: 16, max_age: 120),
			phone: Faker::PhoneNumber.cell_phone,
			status: ApplicationHelper::STATUSES[:activated]
			)

		expect(citizen).to  be_valid
	end

	it "7 - Email is not empty!" do
		citizen = Citizen.new(
			name: Faker::Name.name,
			cpf: input_digits(11),
			cns: input_digits(14),
			email: "",
			birth_date: Faker::Date.birthday(min_age: 16, max_age: 120),
			phone: Faker::PhoneNumber.cell_phone,
			status: ApplicationHelper::STATUSES[:activated]
			)

		expect(citizen).to  be_valid
	end

	it "8 - Email is not valid format!" do
		citizen = Citizen.new(
			name: Faker::Name.name,
			cpf: input_digits(11),
			cns: input_digits(14),
			email: "auauaua@u.s@lala.com",
			birth_date: Faker::Date.birthday(min_age: 16, max_age: 120),
			phone: Faker::PhoneNumber.cell_phone,
			status: ApplicationHelper::STATUSES[:activated]
			)

		expect(citizen).to  be_valid
	end

	it "9 - Birth Date is not empty!" do
		citizen = Citizen.new(
			name: Faker::Name.name,
			cpf: input_digits(11),
			cns: input_digits(14),
			email: Faker::Internet.email,
			birth_date: nil,
			phone: Faker::PhoneNumber.cell_phone,
			status: ApplicationHelper::STATUSES[:activated]
			)
		
		expect(citizen).to  be_valid
	end

	it "10 - Must be over 18 years old!" do
		citizen = Citizen.new(
			name: Faker::Name.name,
			cpf: input_digits(11),
			cns: input_digits(14),
			email: Faker::Internet.email,
			birth_date: Date.today - 16.year,
			phone: Faker::PhoneNumber.cell_phone,
			status: ApplicationHelper::STATUSES[:activated]
			)

		expect(citizen).to  be_valid
	end

		
	it "11 - Status is not empty!" do
		citizen = Citizen.new(
			name: Faker::Name.name,
			cpf: input_digits(11),
			cns: input_digits(14),
			email: Faker::Internet.email,
			birth_date: Faker::Date.birthday(min_age: 18, max_age: 120),
			phone: Faker::PhoneNumber.cell_phone
			)		

		expect(citizen).to  be_valid
	end

	it "12 - Status is not supported!" do
		citizen = Citizen.new(
			name: Faker::Name.name,
			cpf: input_digits(11),
			cns: input_digits(14),
			email: Faker::Internet.email,
			birth_date: Faker::Date.birthday(min_age: 18, max_age: 120),
			phone: Faker::PhoneNumber.cell_phone,
			status: "test"
			)		

		expect(citizen).to  be_valid
	end

end