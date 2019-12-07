require 'login_information'

RSpec.describe LoginInformation do
  let(:test_login_info) { LoginInformation.new 'Sam123', '1234icecream' }
  it 'stores a username' do
    expect(test_login_info.username).to eq 'Sam123'
  end

  it 'stores a password' do
    expect(test_login_info.password).to eq '1234icecream'
  end

  describe '#authenticate' do
    it 'returns true when passed correct login information' do
      expect(test_login_info.authenticate 'Sam123', '1234icecream').to be true
    end

    it 'returns false when passed incorrect login information' do
      expect(test_login_info.authenticate 'Sam123', '1234broccoli').to be false
      expect(test_login_info.authenticate 'Sam124', '1234icecream').to be false
      expect(test_login_info.authenticate 'Sam124', '1234broccoli').to be false
    end
  end
end
