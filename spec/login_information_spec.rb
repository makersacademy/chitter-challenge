require 'login_information'

RSpec.describe LoginInformation do
  before(:each) do
    User.create username: 'Sam123', email: 'sam@example.com', password: '1234icecream'
  end

  describe '#authenticate' do
    it 'returns true when passed correct login information' do
      expect(LoginInformation.authenticate 'sam@example.com', '1234icecream').to be true
    end

    it 'returns false when passed incorrect login information' do
      expect(LoginInformation.authenticate 'sam@example.com', '1234broccoli').to be false
      expect(LoginInformation.authenticate 'notsam@badexample.com', '1234icecream').to be false
      expect(LoginInformation.authenticate 'notsam@badexample.com', '1234broccoli').to be false
    end
  end
end
