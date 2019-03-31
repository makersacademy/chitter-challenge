describe User do
  
  describe '#create' do 
    it 'creates a new user' do 
      user = User.create(name: 'alex', username: 'alexchen', email: 'alex@hotmail.com', password:'12345678')
      expect(user.name).to eq 'alex'
      expect(user.username).to eq 'alexchen'
      expect(user.email).to eq 'alex@hotmail.com'
      expect(user.password).to eq '12345678'
    end 
  end 
end 