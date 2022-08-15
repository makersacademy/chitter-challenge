require "user_repo"

def reset_seeds_table
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  seed_sql = File.read('spec/seeds/chitter_test.sql')
  connection.exec(seed_sql) 
end

RSpec.describe UserRepository do 

  before(:each) do 
    reset_seeds_table
  end

  it "lists the users who have signed up for chitter by email" do 

    repo = UserRepository.new 

    users = repo.all 


    expect(users.length).to eq(3)
    expect(users[0].email).to eq("hulksmash@gmail.com")
    expect(users[1].name).to eq("Alicia")
    expect(users[2].username).to eq("starkent")
    expect(users[2].password).to eq("love3000")
    

  end

  it "finds a specific user with the user's info" do 

    repo = UserRepository.new 

    user = repo.find(1)

    expect(user.email).to eq("hulksmash@gmail.com")
    expect(user.name).to eq("John")
    expect(user.username).to eq("bighulk")
    expect(user.password).to eq("nicesmash")

  end

  it "creates a new user" do 

    repo = UserRepository.new 

    user = User.new 
    user.email = "popeye@hotmail.com"
    user.name = "Alex"
    user.username = "alexrocks"
    user.password = "brock10"

    repo.create(user)

    users = repo.all

    expect(users.last.name).to eq("Alex")
    expect(users.last.password).to eq("brock10")

  end
 
end