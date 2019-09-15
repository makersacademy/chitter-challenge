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
    it 'returns false if a user already exists' do
        truncate_table
        Users.add("Tony Smith", "tomysmith@gmail.com", "tony_smith", "password1234")
        expect(Users.user_exists("tony_smith")).to eq false
    end
  end

end
