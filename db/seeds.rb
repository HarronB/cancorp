# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

OrderProduct.destroy_all
Order.destroy_all
Customer.destroy_all
Product.destroy_all
Category.destroy_all



# can only ask for what they have
# if they have 8 housees, can only call for 8 qunieq
# to use faker properly we must modiy the GEM files   VIEW GEM FILE FOR HOW
3.times do


  cat = Category.create(name: Faker::Cannabis.unique.type)

  5.times do
     cat.products.create(name: Faker::Cannabis.unique.strain,
                            price: Faker::Number.between(10, 20),
                            description: Faker::Cannabis.unique.health_benefit)
  end

end





puts "Number of products: #{Product.count}"
puts "Number of cats: #{Category.count}"
