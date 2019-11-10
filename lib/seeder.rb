require 'faker'
require_relative 'database'

5.times do
  user = User.create(:username => Faker::Internet.username,
  :name => Faker::Name.name, 
  :email => Faker::Internet.email, 
  :password => Faker::Internet.password
  )

  5.times do
    Peep.create(:user_id => user.id,
    :body => Faker::TvShows::GameOfThrones.quote
    )
  end
end
