require 'user'

describe User do
  describe '.create' do
    it 'should create a chitter user with login details' do
      User.create('Pikachu', 'Mighty Pikachu', 'pikachu@gmail.com', '13579pikapika')
      user1 = User.view(1)

      expect(user1.name).to eq 'Pikachu'
      expect(user1.username).to eq 'Mighty Pikachu'
      expect(user1.email).to eq 'pikachu@gmail.com'
      expect(user1.password).to eq '13579pikapika'
    end
  end

  describe '.view' do
    it 'should return user details' do
      User.create('Pikachu', 'Mighty Pikachu', 'pikachu@gmail.com', '13579pikapika')
      User.create('Jingolo', 'Mighty Cat', 'jingolo@gmail.com', '35kitty35')
      
      expect(User.view(1).name).to eq 'Pikachu'
      expect(User.view(2).username).to eq 'Mighty Cat'
    end
  end
end
