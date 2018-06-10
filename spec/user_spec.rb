require './lib/user'
describe User do
  let(:enter_user) { User.create(
    email: 'test@example.com',
    username: 'tester',
    name: 'John Doe',
    password: 'hunter123')
  }
  describe '#create' do
    it 'creates a new user' do
      user = enter_user
      expect(user.id).not_to be_nil
    end
    it 'hashes the password using BCrypt' do
      expect(BCrypt::Password).to receive(:create).with('hunter123')
      enter_user
    end
  end

  describe '#all' do
    it 'returns all the users, as user instances' do
      user = enter_user
      expect(User.all.map(&:id)).to include user.id
    end
  end

  describe '#find' do
    it 'finds a user using the id' do
      user = enter_user
      expect(User.find(user.id).email).to eq user.email
    end
    it 'returns nil if there is no ID given' do
      expect(User.find(nil)).to eq nil
    end
  end


end
