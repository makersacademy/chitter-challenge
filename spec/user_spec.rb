require 'user'

describe User do
  describe '#initialize' do
    it 'inflates database information into instances of the User class' do
      user = User.new(name: 'Birdy', username: 'fly_away', email: 'example@gmail.com')

      expect(user.name).to eq 'Birdy'
      expect(user.username).to eq 'fly_away'
      expect(user.email).to eq 'example@gmail.com'
    end
  end
end