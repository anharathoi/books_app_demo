# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


puts 'Creating an admin user'
admin = User.create({ :email => 'admin@admin.com.au', :password => 'password321', :password_confirmation => 'password321', :admin => true, moderator: false})
puts admin.email

puts 'Creating a regular user'
regular = User.create({ :email => 'test@test.com.au', :password => '123456', :password_confirmation => '123456', :admin => false, moderator: false})
puts regular.email

puts 'Creating a user with moderator privilege'
moderator = User.create({ :email => 'moderator@moderator.com.au', :password => '123456', :password_confirmation => '123456', :admin => false, moderator: true})
puts regular.moderator

puts 'Creating books, authors and reviews'

10.times do 
  author_name = Faker::Book.author
  first_author = Author.create({name: author_name})
  author_name = Faker::Book.author
  second_author = Author.create({name: author_name})
  author_name = Faker::Book.author
  third_author = Author.create({name: author_name})
  5.times do
    title = Faker::Book.title
    description = Faker::Book.genre
    rating = rand(1..5)
    book = Book.new({title: title, description: description, rating: rating})
    book.authors << first_author
    book.authors << second_author if rand(1..5) > 3
    book.authors << third_author if rand(1..5) > 3
    book.save

    3.times do
      book.reviews.create({title: Faker::Artist.name, review: Faker::Restaurant.review})
    end
  end
end

puts "Seeding Over"