require 'sign_up'

describe ChitterSignUp do

  before(:each) do
    ChitterSignUp.new_user("Maurice Bendrix", "mauribendrix", "mauribendrix@gmail.com", "ilovesarah")
    ChitterSignUp.new_user("Sarah Miles", "smiles", "sarahmiles@gmail.com", "ilovemauri")
  end

  describe '.new_user' do
    it 'Creates a new Chitter user' do
      name = "Henry Miles"
      username = "hmiles"
      email = "hmiles@gmail.com"
      password = "iloveher"
      chitter_user = ChitterSignUp.new_user(name, username, email, password)
      expect(ChitterSignUp.all).to include chitter_user
    end

    it 'Hashes the password using BCrypt' do
      expect(BCrypt::Password).to receive(:create).with('password12')

      ChitterSignUp.new_user('Bob', 'bobbob', 'bob@gmail.com', 'password12')
    end

    it 'Does not create a new user if email or username is in use' do
      name = "Mauri Bendrix"
      username = "mauribendrix"
      email = "mauribendrix@gmail.com"
      password = "iloveher!"
      ChitterSignUp.new_user(name, username, email, password)
      users = ChitterSignUp.all
      names = users.map(&:name)
      expect(names).not_to include "Mauri Bendrix"
    end
  end

  describe '#==' do
    it 'Two users are equal if their ids match' do
      user_1 = ChitterSignUp.new(1, 'Bob Bob', 'bobbob', 'bob@gmail.com', 'bob')
      user_2 = ChitterSignUp.new(1, 'Bob Bob', 'bobbob', 'bob@gmail.com', 'bob')
      expect(user_1).to eq user_2
    end
  end
end
