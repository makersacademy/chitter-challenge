require 'user'

describe User do
  context '#all' do
    it 'Lists the users' do
      add_test_users_directly
      expect(User.all.count).to eq 2
    end
  end

  context '#create' do
    it 'Can add users' do
      add_test_users
      expect(User.all).to eq @test_users
    end
  end
end
