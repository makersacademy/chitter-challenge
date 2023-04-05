require 'faker'
require_relative '../lib/user.rb'
require_relative '../lib/post.rb'
require_relative '../lib/reply.rb'

puts 'Seeding...'

User.create(
  username: "Userface",
  real_name: "User Usersmith",
  email: "User@ohuser.com",
  password_digest: "1234"
)

Post.create(
  content: "Hello fren!",
  created_at: DateTime.now,
  updated_at: DateTime.now,
  user_id: 1
)

Reply.create(
  user_id: 1,
  post_id: 1
)

puts 'Seeding completed.'
