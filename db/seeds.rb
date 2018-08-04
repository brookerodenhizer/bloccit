# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'random_data'

# Create Users
5.times do
  User.create!(
# #3
  name:     RandomData.random_name,
  email:    RandomData.random_email,
  password: RandomData.random_sentence
  )
end
users = User.all

# Create Topics
15.times do
  Topic.create!(
    name:         RandomData.random_sentence,
    description:  RandomData.random_paragraph
  )
end
topics = Topic.all

# Create Posts
50.times do
# #1
  Post.create!(
# #2
    user:   users.sample,
    topic:  topics.sample,
    title:  RandomData.random_sentence,
    body:   RandomData.random_paragraph
  )
end
posts = Post.all

# Create SponsoredPosts
25.times do
  SponsoredPost.create!(
    topic:  topics.sample,
    title:  RandomData.random_sentence,
    body:   RandomData.random_paragraph,
    price:  rand(10...50)
  )
end


# Create Comments
# #3
100.times do
  Comment.create!(
# #4
    post: posts.sample,
    body: RandomData.random_paragraph
  )
end
comments = Comment.all

20.times do

  Advertisement.create!(

    title: RandomData.random_sentence,
    copy: RandomData.random_paragraph,
    price: 99
  )
end
advertisements = Advertisement.all

100.times do
  Question.create!(
    title: RandomData.random_sentence,
    body:  RandomData.random_paragraph,
    resolved: false
  )
end

puts "#{Advertisement.count}"
Advertisement.find_or_create_by(title: "A unique title", copy: "Unique copy", price: 99)
puts "#{Advertisement.count}

puts "#{Post.count}"
Post.find_or_create_by!(title: "A unique title", body: "A unique body")
puts "#{Post.count}"

puts "#{Comment.count}"
Comment.find_or_create_by!(post: Post.all.find_by(title: "A unique title"), body: "A unique body")
puts "#{Comment.count}"

user = User.first
user.update_attributes!(
  email: 'youremail.com', # replace this with your personal email
  password: 'helloworld'
)

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Topic.count} topics created"
puts "#{Advertisement.count} advertisement created"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created
puts "#{Question.count} questions created"
