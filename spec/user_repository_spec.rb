require_relative "../lib/user"
require_relative "../lib/user_repository"
require "rspec"

def reset_chitter
  seed_sql = File.read("spec/seeds/seeds_chitter.sql")
  connection = PG.connect({ host: "127.0.0.1", dbname: "chitter_test" })
  connection.exec(seed_sql)
end

describe UserRepository do
  before(:each) do
    reset_chitter
  end

  it "returns all users on chitter" do
    repo = UserRepository.new
    list = repo.all
    expect(list.length).to eq (4)
    expect(list.first.name).to eq ("Ruby Malowitz")
  end

  it "creates a new chitter account" do
    repo = UserRepository.new
    new_user = User.new

    new_user.id = "5"
    new_user.user_name = "Sossy_P"
    new_user.name = "Sophie Peacock"
    new_user.email = "sossyp@gmail.com"

    repo.create(new_user)

    list = repo.all

    expect(list).to include(
      have_attributes(
        id: "5",
        user_name: "Sossy_P",
        name: "Sophie Peacock",
        email: "sossyp@gmail.com",

      )

    )
  end

  it "returns a specific user with ID 1 (Ruby_100)" do
    repo = UserRepository.new
    list_users = repo.find(1)
    expect(list_users.user_name).to eq "ruby_100"
    expect(list_users.name).to eq "Ruby Malowitz"
    expect(list_users.email).to eq "coolperson@aol.com"
    expect(list_users.id).to eq (1)
  end

  it "finds a user by their email address" do
    repo = UserRepository.new

    result = repo.find_by_email("find@me.com")

    expect(result.name).to eq ("Finola Lover")
    expect(result.user_name).to eq ("find_me_online")
    expect(result.id).to eq (4)
  end
end
