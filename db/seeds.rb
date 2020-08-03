# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

airline = Airline.create([
	{
		:name => "First Airline",
		:image_url => "https://test.com",
	},
	{
		:name => "second Airline",
		:image_url => "https://testasd.com",
	}
])

print "airlines: created #{airline.count} rows"

review = Review.create([
	{
		:title => "First title",
		:description => "first description",
		:score => 1,
		:airline_id => airline.first.id
	},
	{
		:title => "second title",
		:description => "second description",
		:score => 4,
		:airline_id => airline.first.id
	},
	{
		:title => "third title",
		:description => "third description",
		:score => 5,
		:airline_id => airline.last.id
	}
])

print "reviews: created #{review.count} rows"
