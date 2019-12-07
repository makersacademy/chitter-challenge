require 'user'

describe User do
  let(:user) { User.new(1, 'EllieM', 'makers@gmail.com', 'PASSWORD123') }
  describe '#username' do
    it 'fills in username' do
      expect(user.username).to eq 'EllieM'
    end
  end
end
