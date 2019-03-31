describe User do
  
  describe '#create' do 
    it 'creates a new user' do 
      user = User.create(name: 'alex', username: 'alexchen', email: 'alex@hotmail.com', password: '12345678')
      expect(user.name).to eq 'alex'
      expect(user.username).to eq 'alexchen'
      expect(user.email).to eq 'alex@hotmail.com'
      expect(user.password).to eq '12345678'
    end 

    it 'hashes password using BCrypt' do 
      expect(BCrypt::Password).to receive(:create)

      User.create(name: 'alex', username: 'alexchen2', email: 'alexander@hotmail.com', password: '12345678')
      
      # no end result
    end 
    # check this

  end 
  
  describe '#find' do 
    it 'finds the user by id' do 
      user = User.create(name: 'alex', username: 'alexchen', email: 'alex@hotmail.com', password: '12345678')
      result = User.find(user.id)

      expect(result.name).to eq user.name
      expect(result.username).to eq user.username

    end 
  end 

end
