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
		:image_url => "https://images.unsplash.com/photo-1532882191016-9133c6d82083?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=360&q=80",
	},
	{
		:name => "Second Airline",
		:image_url => "https://images.unsplash.com/photo-1521899922280-eed2230d7be8?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=360&q=80",
  },
  {
		:name => "Third Airline",
		:image_url => "https://images.unsplash.com/photo-1583013412875-a1ca0d6458d7?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1538&q=80",
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
		:title => "Second title",
		:description => "second description",
		:score => 4,
		:airline_id => airline.first.id
	},
	{
		:title => "Third title",
		:description => "third description",
		:score => 5,
		:airline_id => airline.last.id
	}
])

print "reviews: created #{review.count} rows"
