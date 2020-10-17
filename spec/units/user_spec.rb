describe User do
  describe '#create' do
    let(:username) { 'tester1' }
    let(:user) { 'Test Name' }
    let(:email) { 'email' }
    let(:password) { 'password' }
    
    before do
      @user = described_class.create(name: user, username: username, email: email, password: password)
      @persisted_data = PG.connect(dbname: 'chitter_test').query("SELECT * FROM user WHERE id = #{@user.id};")
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
      expect(@user.id).to eq persisted_data.first['id']
      expect(@user.username).to eq persisted_data.first['username']
    end   
  end
end
