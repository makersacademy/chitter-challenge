require './lib/user'

describe User do
  let(:email) { 'test@test.com' }
  let(:password) { 'test' }

  describe '.create' do
    it 'has create and id attributes' do
      user = User.create(email, password)

      expect(user.id).not_to be_nil
    end
  end

  describe '.all' do
    it 'returns all users as instance of user' do
      user = User.create(email, password)

      expect(User.all.last.id).to eq user.id
    end
  end

  describe '.find' do
    it 'finds a user by ID' do
      user = User.create(email, password)

      expect(User.find(user.id).email).to eq user.email
    end

    it 'returns nil if there is no ID given' do
      expect(User.find(nil)).to eq nil
    end

  end
  
end
