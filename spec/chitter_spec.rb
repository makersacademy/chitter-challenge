require 'chitter'
require 'peep'
require 'user'
require 'database_connection'
require 'database_helpers'

  
describe Chitter do

  context 'Peeps' do 
    describe '.create' do
      it 'creates a new peep' do
        peep = Chitter.create_peep(message: "Yo, Tom from MySpace here")
        expect(peep.message).to eq "Yo, Tom from MySpace here" 
      end
    end

    describe '.all' do
      it 'returns a list of peeps' do
        #connects to DB
        connection = PG.connect(dbname: 'bookmark_manager_test')
        # Add the test data
        peep = Chitter.create_peep(message: "Yo, Tom from MySpace here")
        Chitter.create_peep(message: "fakenews")
        Chitter.create_peep(message: "doge to the moon")
        #calls All to return all tests
        peeps = Chitter.all_peeps
        #expected outcomes
        expect(peeps.length).to eq 3
        expect(peeps.first).to be_a Peep
        expect(peeps.first.id).to eq peep.id
        expect(peeps.first.message).to eq 'Yo, Tom from MySpace here'
       end
     end
  end
  
  context 'User' do 
    describe '.setup' do
      it 'creates a new user' do
        user = Chitter.setup_user(email: 'superhans@chitter.com', password: 'guessme')
  
        persisted_data = persisted_data(table: :users, id: user.id)
  
        expect(user).to be_a User
        
        expect(user.email).to eq 'superhans@chitter.com'
      end
    end

    describe '.create_peep' do
      it 'hashes the password using BCrypt' do
        expect(BCrypt::Password).to receive(:create).with('guessme')
    
        Chitter.setup_user(email: 'superhans@chitter.com', password: 'guessme')
      end
    end
  
    describe '.find_user' do
      it 'finds a user by ID' do
        user = Chitter.setup_user(email: 'superhans@chitter.com', password: 'guessme')
        result = Chitter.find_user(id: user.id)
    
        expect(result.id).to eq user.id
        expect(result.email).to eq user.email
      end
    end
  
      it 'returns nil if there is no ID given' do
        expect(Chitter.find_user(id: nil)).to eq nil
      end

    describe '.authenticate' do
      it 'returns a user given a correct username and password, if one exists' do
        user = Chitter.setup_user(email: 'superhans@chitter.com', password: 'guessme')
        authenticated_user = Chitter.authenticate_user(email: 'superhans@chitter.com', password: 'guessme')
  
        expect(authenticated_user.id).to eq user.id
      end
    end

      it 'returns nil given an incorrect email address' do
        user = Chitter.setup_user(email: 'superhans@chitter.com', password: 'guessme')
    
        expect(Chitter.authenticate_user(email: 'nohans@chitter.com', password: 'guessme')).to be_nil
    end

      it 'returns nil given an incorrect password' do
        user = Chitter.setup_user(email: 'superhans@chitter.com', password: 'guessme')
    
        expect(Chitter.authenticate_user(email: 'superhans@chitter.com', password: 'emsseug')).to be_nil
    end
  end
end
