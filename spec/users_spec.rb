require 'model_router'

describe User do
  let(:user_details) {[
    {'email' => 'bob@testing.com'},
    {'email' => 'fred@testing.com'}
  ]}

  context '#all' do
    it 'Stores users' do
      add_test_users_directly(user_details)
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
