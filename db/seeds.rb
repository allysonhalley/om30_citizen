# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
####
# CREATE SCAFFOLDS
# rails g scaffold Photo image_data:text
# rails g scaffold Citizen name:string cpf:string cns:string email:string birth_date:date phone:string photo:references status:string
# rails g scaffold Citizen name:string cpf:string cns:string email:string birth_date:date phone:string status:string
# *rails g migration add_photo_to_citizen photo:text

def code_string_generator(code_length)
	code = ""
	i = 0
	while code_length > i do
		code = code+(rand(0..9).to_s)
		i += 1
	end
	code
end

10.times do |i|
	
	Citizen.create!(
		name: Faker::Name.name,
		cpf: code_string_generator(11),
		cns: code_string_generator(14),
		email: Faker::Internet.email,
		birth_date: Faker::Date.birthday(min_age: 16, max_age: 120),
		phone: Faker::PhoneNumber.cell_phone,
		status: "actived"
	)

end

puts "Created 10 citizens!"