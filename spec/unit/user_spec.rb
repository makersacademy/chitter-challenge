require 'user'

describe User do
  describe '.sign_up' do
    it 'adds users details to users array' do
      new_user = User.sign_up(username: 'Kiki Dawson', email: 'kiki@chitter.com')
      persisted_data = persisted_data(id: new_user.id, table: 'users')

      expect(new_user.username).to eq persisted_data.first['username']
    end
  end
end
