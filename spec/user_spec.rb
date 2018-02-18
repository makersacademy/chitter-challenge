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
  end

end
