# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


puts 'Creating an admin user'
User.create({ :email => 'admin@admin.com.au', :password => 'password321', :password_confirmation => 'password321', :admin => true, moderator: false})


puts 'Creating books and authors'

10.times do 
  author_name = Faker::Book.author
  author = Author.create({name: author_name})
  5.times do
    title = Faker::Book.title
    description = Faker::Book.genre
    rating = rand(1..5)
    # author_id = author.id
    book = Book.new({title: title, description: description, rating: rating})
    book.author_id = author.id
    book.save

    3.times do
      book.reviews.create({title: Faker::Artist.name, review: Faker::Restaurant.review})
    end
  end
end

puts "Seeding Over"