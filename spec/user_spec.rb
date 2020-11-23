require 'profile'
require 'database_helpers'

describe Profile do
  describe '.create' do
    it 'creates a new profile' do
      profile = Profile.create(email: 'mario@mario.com', password: 'password', name: 'Mario Mario', username: 'Mario123')

      persisted_data = persisted_data(id: profile.id)

      expect(profile).to be_a Profile
      expect(profile.id).to eq persisted_data['id']
      expect(profile.email).to eq 'mario@mario.com'
      expect(profile.name).to eq 'Mario Mario'
      expect(profile.username).to eq 'Mario123'
    end

    # it 'hashes the password using BCrypt' do
    #   expect(BCrypt::Password).to receive(:create).with('password123')
    #
    #   Profile.create(email: 'test@example.com', password: 'password123')
    # end
  end

  describe '.find' do
    it 'finds the profile by ID' do
      profile = Profile.create(email: 'mario@mario.com', password: 'password', name: 'Mario Mario', username: 'Mario123')
      result = Profile.find(id: profile.id)

      expect(result.id).to eq profile.id
      expect(result.email).to eq profile.email
    end

    it 'returns nil if there is no ID given' do
      expect(Profile.find(id: nil)).to eq nil
    end

  end

  describe '.authenticate' do
    it 'returns a profile given a correct username and password if one exists' do
      profile = Profile.create(email: 'mario@mario.com', password: 'password', name: 'Mario Mario', username: 'Mario123')
      authenticated_user = Profile.authenticate(email: 'mario@mario.com', password: 'password')
      expect(authenticated_user.id).to eq profile.id
    end

    it 'returns nil given an incorrect email address' do
      profile = Profile.create(email: 'mario@mario.com', password: 'password', name: 'Mario Mario', username: 'Mario123')
      expect(Profile.authenticate(email: 'nottherightemail@me.com', password: 'password123')).to be_nil
    end

    it 'returns nil given an incorrect password' do
      profile = Profile.create(email: 'mario@mario.com', password: 'password', name: 'Mario Mario', username: 'Mario123')
      expect(Profile.authenticate(email: 'mario@mario.com', password: 'password123')).to be_nil
    end
  end

end
