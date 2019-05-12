require 'user'

describe User do
  describe '#create' do
    it 'creates a new user' do
    connection = PG.connect dbname: "chitter_test"
    user = User.create(name: "Joey Tribbiani", email: "joey@babykangaroo.com", password: "friends")
    expect(user.name).to eq "Joey Tribbiani"
    end
  end 
end
