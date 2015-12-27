require_relative '../app/models/user'

describe User do
  let!(:user) do
    User.create(name: 'Giamir Buoncristiani',
                username: 'giamir',
                email: 'giamir@email.com',
                password: 'giamir')
  end
  describe '::authenticate' do
    it 'returns user id if passwords match and username is passed' do
      expect(described_class.authenticate('giamir', 'giamir'))
        .to eq user.id
    end
    it 'returns user id if passwords match and email is passed' do
      expect(described_class.authenticate('giamir@email.com', 'giamir'))
        .to eq user.id
    end
    it 'returns nil if passwords do not match' do
      expect(described_class.authenticate('giamir@email.com', 'wrong'))
        .to be nil
    end
  end
end
