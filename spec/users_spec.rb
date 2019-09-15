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

end
