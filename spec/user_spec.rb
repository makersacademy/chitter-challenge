require 'user'

describe User do
  
  describe '.add' do
    it 'add a new user to the database' do
      User.add("Julie","jj","jj@gmail.com", "hellohello")
      expect(User.new.name).to eq "Julie"
    end
  end

end

