require_relative '../app/models/user'

describe User do
  subject(:user) { described_class }

  before :all do
    @user = User.create(:name => 'Sansa Stark',
                        :username => 'sassgrrrrl',
                        :email => 'sansa@winterfell.com',
                        :password => 'ripjoffreyLOLZ',
                        :password_confirmation => 'ripjoffreyLOLZ')
  end

  describe '#self.authenticate' do
    it 'returns nil if user does not exist' do
      expect(User.authenticate('skanka@winterfell.com', 'ripjoffreyLOLZ')).to eq nil
    end

    it 'returns nil if password is incorrect' do
      expect(User.authenticate('sansa@winterfell.com', 'ilovejoffrey')).to eq nil
    end

    it 'returns current user if details are correct' do
      expect(User.authenticate('sansa@winterfell.com', 'ripjoffreyLOLZ')).to eq @user
    end
  end
end
