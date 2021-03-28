require 'user'

describe User do 
  let(:david) { User.create(name: 'David Attenborough', email: 'davidattenboroughk@gmail.com', password: 'SaveThePlanet123') }

  describe '.create' do 
    it 'should be able to create new users' do 
      expect(david).to be_a User 
      expect(david.name).to eq 'David Attenborough'
      expect(david.email).to eq 'davidattenboroughk@gmail.com'
    end 

    it 'hashes the password using BCrypt' do
      expect(BCrypt::Password).to receive(:create).with('password123')
  
      User.create(name: 'Lizzo', email: 'bossbitch@example.com', password: 'password123')
    end
  end 

  describe '.find' do 
    it 'should be able to find any user in the database by id' do 
      user = User.create(name: 'Gretta Tunberg', email: 'gretta@tunny.com', password: 'GiveMeAFuture15')
      result = User.find(user.id)
  
      expect(result.id).to eq user.id
      expect(result.email).to eq user.email    
    end 

    it 'returns nil if there is no ID given' do
      expect(User.find(nil)).to eq nil
    end
  end 

  describe '.authenticate' do 
    it 'can recognise a user and log in' do 
      user = User.create(name: 'David Attenborough', email: 'davidattenboroughk@gmail.com', password: 'SaveThePlanet123')
      authenticated = User.authenticate(name: 'David Attenborough', password: 'SaveThePlanet123')
    end 
  end 
end