require 'user'

describe User do
  let(:test_user_1) { 'bob@testing.com' }
  let(:test_user_2) { 'fred@testing.com' }
  let(:test_users) { [test_user_1, test_user_2] }
  context '#all' do
    it 'Lists the users' do
      User.create(:email => test_user_1)
      User.create(:email => test_user_2)
      expect(User.all).to eq test_users
    end
  end
end
