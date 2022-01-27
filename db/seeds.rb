# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# HINT; USE Model.order('RANDOM()').first, to choose a random topic, for dynamic list generation.

require 'faker'

# Clear database instances:
def clear_database
  List.destroy_all
  Topic.destroy_all
  User.destroy_all
  puts 'cleaned and seeded users successful'
end

# Clean and make users
def make_users
  10.times do
    User.find_or_create_by(
      username: ''.concat(Faker::Name.unique.first_name, Faker::Alphanumeric.unique.alphanumeric(number: 4, min_numeric: 3)),
      password_digest: 'password123'
    )
  end
  puts 'Users seeded. Starting next seed...'
end

# Clean and make seed topics
def make_topics
  faker_topics = [
    'Dessert', # Faker::Dessert.unique.variety
    'Vehicles', # Faker::Vehicle.unique.make_and_model
    'Books', # Faker::Book.unique.title
    'Animal', # Faker::Creature::Animal.unique.name
    'Video Games', # Faker::Game.unique.title
    'Movies', # Faker::Movie.unique.title
    'Restaurants', # Faker::Restaurant.unique.name
    'Coffee Blends', # Faker::Coffee.unique.blend_name
    'Numbers', # Faker::Number.unique.number(digits: 5)
    'Pokemon' # Faker::Pokemon.unique.name
  ]
  faker_topics.each { |t| Topic.find_or_create_by(name: t.to_s) }
  puts 'Topics generated. Starting next seed...'
end

# Build this method out to dynamically create
#   randomly generated lists with the topics I created using Faker gem.
def create_lists_for_users
  1000.times do
    u = User.order('RANDOM()').first
    t = Topic.order('RANDOM()').first
    build_list_for_user(u, t)
  end
end

def build_list_for_user(user, topic)
  l = user.lists.create(
    topic_id: topic.id,
    title: "tl_best_#{SecureRandom.alphanumeric(8)}",
    description: 'This test is generated by seed data.',
    item_1: '',
    item_2: '',
    item_3: '',
    item_4: '',
    item_5: ''
  )

  case topic.name
  when 'Dessert'
    for i in 1..10 do
      l.update("item_#{i}" => Faker::Dessert.variety)
    end
  when 'Vehicles'
    for i in 1..10 do
      l.update("item_#{i}" => Faker::Vehicle.make_and_model)
    end
  when 'Books'
    for i in 1..10 do
      l.update("item_#{i}": Faker::Book.title)
    end
  when 'Animal'
    for i in 1..10 do
      l.update("item_#{i}": Faker::Creature::Animal.name)
    end
  when 'Video Games'
    for i in 1..10 do
      l.update("item_#{i}": Faker::Game.title)
    end
  when 'Movies'
    for i in 1..10 do
      l.update("item_#{i}": Faker::Movie.title)
    end
  when 'Restaurants'
    for i in 1..10 do
      l.update("item_#{i}": Faker::Restaurant.name)
    end
  when 'Coffee Blends'
    for i in 1..10 do
      l.update("item_#{i}": Faker::Coffee.blend_name)
    end
  when 'Numbers'
    for i in 1..10 do
      l.update("item_#{i}": Faker::Number.unique.number(digits: 5))
    end
  when 'Pokemon'
    for i in 1..10 do
      l.update("item_#{i}": Faker::Games::Pokemon.name)
    end
  end
  puts 'Lists created for users'
end

clear_database
make_users
make_topics
create_lists_for_users
puts 'Database seeding completed.'
