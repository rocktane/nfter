require 'faker'

puts 'Cleaning database...'
Transaction.destroy_all
Nft.destroy_all
User.destroy_all

puts 'Creating users...'
10.times do |_user|
  username = Faker::Internet.username
  email = Faker::Internet.email(domain: 'gmail.com')
  password = Faker::Internet.password
  User.create!(username: username, email: email, password: password)
end

puts 'Creating NFT...'

10.times do |_nft|
  name = Faker::Hipster.words(number: 2)
  description = Faker::Lorem.paragraphs(number: 1, supplemental: true)
  availability = Faker::Boolean.boolean
  price = Faker::Number.between(from: 150, to: 300)
  user_id = User.all.sample
  Nft.create!(name: name.join(' '), description: description[0], availability: availability, price: price, user: user_id)
end

puts 'Finished!'
