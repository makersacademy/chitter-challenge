require 'user'

describe User do
  before do
    add_users_to_test_database
  end

  describe '::all' do
    it 'should return users' do
      user = described_class.all.first
      expect(user).to be_a User
      expect(user.id).to eq '1'
      expect(user.email).to eq 'albob123@gmail.com'
      expect(user.password).to eq 'password123'
      expect(user.name).to eq 'Alice Bobson'
      expect(user.username).to eq 'albob123'
    end
  end
end
