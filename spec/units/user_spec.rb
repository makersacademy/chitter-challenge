require 'user'

describe User do
  describe '.create' do
    it 'creates a new user' do
      kermit = User.create('froggy5', 'Kermit The Frog', 'kermit@hotmail.com', 'baconlover75')
      expect(kermit.username).to eq 'froggy5'
      expect(kermit.name).to eq 'Kermit The Frog'
      expect(kermit.email).to eq 'kermit@hotmail.com'
      expect(kermit.password).to eq 'baconlover75'
    end
  end
end