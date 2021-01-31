describe User do
  let(:name) { 'Hugh' }
  let(:user_name) { 'hughy19' }
  let(:password) { 'password123' }
  let(:email_address) { 'test_email@server.com' }

  describe '.create' do
    let(:new_user) { described_class.create(name, user_name, password, email_address) }
    let(:id) { new_user.id }
    let(:added_data) { persisted_data(id: id, table: 'chitterer').first }

    it 'returns a user object' do
      expect(new_user).to be_an_instance_of(User)
    end

    it 'adds the user to the users table' do
      expect(id).to eq added_data['id'].to_i
    end

    it 'has the right name' do
      expect(added_data['name']).to eq name
    end

    it 'has the right user name' do
      expect(added_data['username']).to eq user_name
    end

    it 'has the right email address' do
      expect(added_data['email_address']).to eq email_address
    end

    it 'has the right password' do
      expect(BCrypt::Password.new(added_data['password'])).to eq password
    end

  end
end
