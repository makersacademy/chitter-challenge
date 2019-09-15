require 'users'

describe Users do
  describe '.add' do
    it 'adds a user' do
        truncate_table
        user = Users.add("Tony Smith", "tomysmith@gmail.com", "tony_smith", "password1234")
        expect(user.name).to eq "Tony Smith"
        expect(user.email).to eq "tomysmith@gmail.com"
    end
  end

  describe '.user_exists' do
    it 'returns true if a user already exists' do
        truncate_table
        Users.add("Tony Smith", "tomysmith@gmail.com", "tony_smith", "password1234")
        expect(Users.user_exists("tony_smith")).to eq true
    end
  end

  describe '.log_in' do
    it 'returns the user name of the user if they already exist' do
        truncate_table
        Users.add("Tony Smith", "tomysmith@gmail.com", "tony_smith", "password1234")
        expect(Users.log_in("tony_smith", "password1234")).to eq "tony_smith"
    end

    it 'returns false of the user if they already exist' do
        truncate_table
        expect(Users.log_in("tony_smith", "password1234")).to eq false
    end

  end

end
