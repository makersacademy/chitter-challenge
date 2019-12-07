require 'user'

describe User do
  let(:user) { User.new(id: 1, username: 'EllieM', email: 'makers@gmail.com', password: 'PASSWORD123') }
  describe '#username' do
    it 'fills in username' do
      expect(user.username).to eq 'EllieM'
    end
  end
end
