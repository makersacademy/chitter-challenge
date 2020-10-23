require 'user'

describe User do
  describe '#create' do
    let(:username) { 'tester1' }
    let(:user) { 'Test Name' }
    let(:email) { 'email' }
    let(:password) { 'password' }
    let(:username2) { 'tester2' }
    let(:email2) { 'Test 2 Name' }
    
    before do
      @user = described_class.create(name: user, username: username, email: email, password: password)
      @persisted_data = PG.connect(dbname: 'chitter_test').query("SELECT * FROM users WHERE id=#{@user.id};")
    end
    
    it 'returns a User instance' do
      expect(@user).to be_a User
      expect(@user.username).to eq username
    end

    it 'inserts a row into the users table' do 
      expect(@persisted_data.first['username']).to eq username
      expect(@persisted_data.first['name']).to eq user
      expect(@persisted_data.first['email']).to eq email
      expect(@persisted_data.first['password']).to eq password
    end

    it 'returns a User instance that matches the data inserted into the table' do
      expect(@user.id).to eq @persisted_data.first['id']
      expect(@user.username).to eq @persisted_data.first['username']
    end
    
    context 'invalid signups' do
      let(:users) { DatabaseConnection.query("SELECT * FROM users;") }  
      
      context 'duplicate username' do
        it 'returns a helpful error' do      
          expect(User.create(name: user, username: username, email: email2, password: password)).to eq :duplicate_username
        end

        it 'does not store a user in the db' do
          expect { User.create(name: user, username: username, email: email2, password: password) }.not_to change(users, :ntuples)        end
        end

      context 'duplicate email' do
        it 'returns a helpful error if the email is a duplicate' do
          expect(User.create(name: user, username: username2, email: email, password: password)).to eq :duplicate_email
        end

        it 'does not store a user in the db' do
          expect { User.create(name: user, username: username2, email: email, password: password) }.not_to change(users, :ntuples)
        end
      end
    end
  end
end
