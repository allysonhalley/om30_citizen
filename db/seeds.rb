include ApplicationHelper
####
# CREATE SCAFFOLDS
# rails g scaffold Photo image_data:text
# rails g scaffold Citizen name:string cpf:string cns:string email:string birth_date:date phone:string photo:references status:string
# rails g scaffold Citizen name:string cpf:string cns:string email:string birth_date:date phone:string status:string
# *rails g migration add_photo_to_citizen photo:text
# rails g scaffold Address cep:string street:string complement:string district:string city:string state:string ibge_code:string citizen:references

### Seed Citizen ###
10.times do |i|
	
	Citizen.create!(
		name: Faker::Name.name,
		cpf: ApplicationHelper::code_string_generator(11),
		cns: ApplicationHelper::code_string_generator(14),
		email: Faker::Internet.email,
		birth_date: Faker::Date.birthday(min_age: 18, max_age: 120),
		phone: Faker::PhoneNumber.cell_phone,
		status: "activated"
	)
end
puts "Created 10 citizens!"

## Seed Address ###
10.times do |i|
	address = Address.create!(
		citizen: Citizen.find(Citizen.ids.sample),
		postcode: Faker::Address.postcode,
		street: Faker::Address.street_name,
		district: Faker::Address.street_name,
		city: Faker::Address.city,
		state: Faker::Address.state,
		complement: Faker::Address.secondary_address,
		ibge_code: ApplicationHelper::code_string_generator(5)			
		)
end
puts "Created 10 addresses!"
