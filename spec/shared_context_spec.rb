require "database_connection"

shared_context "doubles setup" do

  def reset_users_table
    seed_sql = File.read('spec/users_seeds.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_database_test' })
    connection.exec(seed_sql)
  end
  def reset_peeps_table
    seed_sql = File.read('spec/peeps_seeds.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_database_test' })
    connection.exec(seed_sql)
  end

#   let(:user1) do 
#     double(:User, {
#       fullname: "Chang Huynh", 
#       username: "changwynn", 
#       email: "huynchang@gmail.com", 
#       password: "passworD+123"
#     })
#   end
#   let(:user2) do 
#     double(:User, {
#       fullname: "John Doe", 
#       username: "jdoe", 
#       email: "johndoe@hotmail.com", 
#       password: "Password.456"
#     })
#   end
#   let(:user3) do 
#     double(:User, {
#       fullname: "Mike Bike", 
#       username: "mrbike", 
#       email: "mike.bike@live.com", 
#       password: "paSSword$789"
#     })
#   end
#   let(:peep1) do 
#     double(:Peep, {
#       time: "2023-03-09 16:32:54.912033", 
#       content: "How are you guys doing, today?\u{1F60A} @jdoe @mrbike", 
#       user_id: 1 
#     })
#   end
#   let(:peep2) do 
#     double(:Peep, {
#       time: "2023-03-09 16:35:54.912033", 
#       content: "Hey @changwynn, I am pretty well \u{1F60E} What about you?", 
#       user_id: 2 
#     })
#   end
#   let(:peep3) do 
#     double(:Peep, {
#       time: "2023-03-09 16:45:54.912033", 
#       content: "@jdoe @changwynn guys, Have you watched the game yesterday?\u{1F632}", 
#       user_id: 3
#     })
#   end
end