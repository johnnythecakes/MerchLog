# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
users = User.create([{f_name: "First Name", l_name: "Last Name", password: "Password", address: "Address", city: "City", state: "State", zip: "Postal Code", email: "Email", country: "Country"}])
products = Product.create([{name: "Name", category: "Category", subcategory: "Subcategory", make: "Make", description: "Description", warranty: "False", w_length: "2", p_price: "10.00", c_price: "7.00", purchased_on: "Date"}])