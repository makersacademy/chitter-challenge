require 'user'

describe User do
  describe '.create' do
    it 'creates a new user' do
      kermit = User.create('froggy5', 'kermit@hotmail.com', 'baconlover75')
      expect(kermit.username).to eq 'froggy5'
      expect(kermit.email).to eq 'kermit@hotmail.com'
      expect(kermit.password).to eq 'baconlover75'
    end
  end
end