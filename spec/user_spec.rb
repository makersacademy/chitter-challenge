require 'user'

describe User do
  describe '.create' do
    it 'should create a chitter user with login details' do
      User.create('Pikachu', 'mightypikachu', 'pikachu@gmail.com', '13579pikapika')
      user1 = User.view(1)

      expect(user1.name).to eq 'Pikachu'
      expect(user1.username).to eq 'mightypikachu'
      expect(user1.email).to eq 'pikachu@gmail.com'
      expect(user1.password).to eq '13579pikapika'
    end
  end

  describe '.view' do
    it 'should return user details' do
      User.create('Pikachu', 'mightypikachu', 'pikachu@gmail.com', '13579pikapika')
      User.create('Jingolo', 'mightycat', 'jingolo@gmail.com', '35kitty35')
      
      expect(User.view(1).name).to eq 'Pikachu'
      expect(User.view(2).username).to eq 'mightycat'
    end
  end

  describe '.all' do
    it 'should return all users' do
      User.create('Pikachu', 'mightypikachu', 'pikachu@gmail.com', '13579pikapika')
      User.create('Jingolo', 'mightycat', 'jingolo@gmail.com', '35kitty35')

      expect(User.all[0].email).to include 'pikachu@gmail.com'
      expect(User.all[1].name).to include 'Jingolo'
    end
  end
end
