require 'user'

describe User do
    it 'expects to find a message in the database' do
      clean_database
      User.create(
        :username       => "George",
        :email          => "test@gmail.com",
        :password       => "Tuesday"
      )
      user = User.first(:username => "George")
      expect(user['email']).to eq "test@gmail.com"
    end
end
