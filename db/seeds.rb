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