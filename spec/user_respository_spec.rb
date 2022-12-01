require 'user'
require 'user_repository'

def reset_users_table
  seed_sql = File.read('spec/seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec(seed_sql)
end

describe UserRepository do
  before(:each) do 
    reset_users_table
  end

  # (your tests will go here).

  it "returns all users" do
    repo = UserRepository.new

    users = repo.all

    expect(users.length).to eq # =>  2

    expect(users[0].id).to eq '1'
    expect(users[0].name).to eq 'David'
    expect(users[0].email_address).to eq 'email_1@yahoo.co.uk'
    expect(users[0].password).to eq '##^%$&^$#'

    expect(users[1].id).to eq '2'
    expect(users[1].name).to eq 'Anna'
    expect(users[1].email_address).to eq 'email_2@gmail.com'
    expect(users[1].password).to eq '#%%&^%££###'
  end
end