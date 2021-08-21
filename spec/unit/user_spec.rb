require 'user'

describe User do
  describe '.initialize' do
    it 'has a name' do
      add_user
      expect(described_class.all[0].name).to eq 'Lizzy'
    end

    it 'has a username' do # still need to test for unique
      add_user
      expect(described_class.all[0].username).to eq 'eballantine'
    end

    it 'has an email address' do # still need to test for unique
      add_user
      expect(described_class.all[0].email).to eq 'lizzy@hey.com'
    end
  end

  describe '.authenticate' do
    it 'returns nil given an incorrect email' do
      add_user
      expect(User.authenticate('lizzzzy@hey.com', 'Possward123')).to be_nil
    end
  end
end
