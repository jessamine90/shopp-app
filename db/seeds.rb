# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Category.create :name => "Slodkosci"
Category.create :name => "Slicznosci"

Product.create :name => "dropsy", :description => "mniam mniam mniam", :price => 1999, :category_id => 1
Product.create :name => "mordoklejki", :description => "mmmmmm mniam", :price => 2599, :category_id => 1