require './lib/user'

describe User do
  let(:email) { 'test@test.com' }
  let(:wrong_email) { 'test2@test.com' }
  let(:wrong_password) { 'wrong' }
  let(:password) { 'test' }

  describe '.create' do
    it 'has id attribute' do
      user = User.create(email, password)
      expect(user.id).not_to be_nil
    end

    it 'hashes the password' do
      expect(BCrypt::Password).to receive(:create).with(password)
      User.create(email, password)
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

  describe '.authenticate' do
    it 'returns user id given correct email' do
      new_user = User.create(email, password)
      expect(User.authenticate(email, password)).not_to be_nil
    end

    it 'returns nil given incorrect email' do
      new_user = User.create(email, password)
      expect(User.authenticate(wrong_email, password)).to be_nil
    end

    it 'returns nil given an incorrect password' do
      user = User.create(email, password)
      expect(User.authenticate(email, wrong_password)).to be_nil
    end

  end

end
