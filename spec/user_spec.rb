require 'user'

describe User do
  describe '::all' do
    it 'returns all users as an array of User instances' do
      user = described_class.create(email: 'mynameis@email.com', password: 'mostsecurepassword')
      expect(described_class.all.map(&:id)).to include user.id
    end
  end

  describe '::create' do
    it 'creates a new user' do
      user = described_class.create(email: 'mynameis@email.com', password: 'mostsecurepassword')
      expect(user.id).not_to be_nil
    end
    it 'hashes the provided password with BCrypt' do
      expect(BCrypt::Password).to receive(:create).with('mostsecurepassword')
      described_class.create(email: 'mynameis@email.com', password: 'mostsecurepassword')
    end
  end

  describe '::find' do
    it 'finds a user by ID' do
      user = described_class.create(email: 'happybirthday@forever.com', password: 'Iamawesome')
      expect(described_class.find(user.id).email).to eq user.email
    end
    it 'returns nil unless id is found' do
      expect(described_class.find(nil)).to eq nil
    end
  end

end
