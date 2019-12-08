require 'user'

RSpec.describe User do
  let(:user_info) { { id: 1, username: 'Sam123', email: 'sam@example.com', password: '1234icecream' } }
  let(:test_user) { User.where(id: 1).first }

  before(:each) do
    User.create user_info
  end

  it 'has a seperate username' do
    expect(test_user.username).to eq 'Sam123'
  end

  it 'has a login email' do
    expect(test_user.email).to eq 'sam@example.com'
  end

  it 'has a login password' do
    expect(test_user.password).to eq '1234icecream'
  end

  it 'can send a peep' do
    expect { test_user.peep 'this is a peep', user_info[:id] }.to change { test_user.all_peeps.length }.by 1
  end

  it 'can access a history of all peeps' do
    test_user.peep 'this is a peep', user_info[:id]
    test_user.peep 'this is another peep', user_info[:id]

    all_peeps = test_user.all_peeps.map(&:body)

    expect(all_peeps).to eq ['this is a peep', 'this is another peep']
  end

  describe 'login status' do
    it 'knows when it is logged in' do
      User.log_in test_user
      
      expect(test_user.logged_in).to be true
    end

    it 'knows when it is logged out' do
      User.log_out test_user

      expect(test_user.logged_in).to be false
    end
  end
end
