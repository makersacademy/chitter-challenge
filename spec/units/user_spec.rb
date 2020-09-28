require 'user'

describe User do
<<<<<<< HEAD
  describe '.create' do
    it 'creates a new user' do
      kermit = User.create('froggy5', 'Kermit The Frog', 'kermit@hotmail.com', 'baconlover75')
      expect(kermit.username).to eq 'froggy5'
      expect(kermit.name).to eq 'Kermit The Frog'
      expect(kermit.email).to eq 'kermit@hotmail.com'
      expect(kermit.password).to eq 'baconlover75'
    end
  end
=======
  describe '#initialize' do
    it 'creates a new user' do
      kermit = User.new('froggy5')
      expect(kermit.username).to eq 'froggy5'
    end
  end

  describe '.create' do
    it 'adds a user to the database' do
      clear_table('users')
      kermit = User.create('froggy5', 'Kermit The Frog', 'kermit@hotmail.com', 'baconlover75')
      expect(kermit[0]['username']).to eq 'froggy5'
      expect(kermit[0]['name']).to eq 'Kermit The Frog'
    end
  end


>>>>>>> assets
end