# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = [
	{firstname: "saim", lastname: "sohail", email: "181370010@gift.edu.pk", contact: "0324-8788309", type_of: 1, city: "gujranwala", country: "pakistan", street: "300", password: "181370010"},
	{firstname: "saleh", lastname: "tahir", email: "181370008@gift.edu.pk", contact: "0324-8788309", type_of: 0, city: "gujranwala", country: "pakistan", street: "300", password: "181370008"},
	{firstname: "ubada", lastname: "bin zubair", email: "18137003@gift.edu.pk", contact: "0324-8788309", type_of: 2, city: "gujranwala", country: "pakistan", street: "300", password: "18137003"},
	{firstname: "junaid", lastname: "javed", email: "181370053@gift.edu.pk", contact: "0324-8788309", type_of: 2, city: "gujranwala", country: "pakistan", street: "300", password: "181370053"},
	{firstname: "haider", lastname: "amanat", email: "181370025@gift.edu.pk", contact: "0324-8788309", type_of: 0, city: "gujranwala", country: "pakistan", street: "300", password: "181370025"},
	{firstname: "zubair", lastname: "amanat", email: "181370029@gift.edu.pk", contact: "0324-8788309", type_of: 1, city: "gujranwala", country: "pakistan", street: "300", password: "181370029"}
]

User.create!(users)

p "#{User.count} are created.."