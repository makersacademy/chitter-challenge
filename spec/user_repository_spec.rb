require "user"
require "user_repository"

def reset_users_table
  seed_sql = File.read("spec/seeds/users_seeds.sql")
  connection = PG.connect({ host: "127.0.0.1", dbname: "chitter_test" })
  connection.exec(seed_sql)
end

describe UserRepository do
  before(:each) { reset_users_table }

  it "finds all users" do
    repo = UserRepository.new

    users = repo.all
    expect(users.length).to eq(3)
    expect(users.first.name).to eq("Erykah Badu")
    expect(users.first.email).to eq("erykah@gmail.com")
    expect(users.first.username).to eq("BagLady")
    expect(users.first.password).to eq("Baduizm99")
  end

  it "finds one user" do
    repo = UserRepository.new

    user = repo.find(3)
    expect(user.name).to eq("Solange Knowles")
    expect(user.email).to eq("solange@gmail.com")
    expect(user.username).to eq("TheBetterSis")
    expect(user.password).to eq("seat@thetable")
  end

  it "creates a new user" do
    repo = UserRepository.new

    new_user = User.new
    new_user.name = "Little Simz"
    new_user.email = "simz@gmail.com"
    new_user.username = "LittleSimz"
    new_user.password = "Nothankyou?"
    repo.create(new_user)

    users = repo.all

    expect(users.length).to eq(4)
    expect(users.last.name).to eq("Little Simz")
    expect(users.last.email).to eq("simz@gmail.com")
    expect(users.last.username).to eq("LittleSimz")
    expect(users.last.password).to eq("Nothankyou?")
  end

  it "deletes a user" do
    repo = UserRepository.new

    repo.delete(1)
    users = repo.all

    expect(users.length).to eq(2)
    expect(users.first.id).to eq(2)
  end
end
