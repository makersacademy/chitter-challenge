describe User do
  let(:name) { 'Hugh' }
  let(:user_name) { 'hughy19' }
  let(:password) { 'password123' }
  let(:email_address) { 'test_email@server.com' }
  let(:new_user) { described_class.create(name: name, username: user_name, password: password, email_address: email_address) }
  let(:id) { new_user.id }
  let(:added_data) { persisted_data(id: id, table: 'chitterer').first }

  describe '.create' do
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

    context 'when trying to create a user with same username' do

      let(:different_email_address) { 'different_email@google.com'}
      let(:second_user) { described_class.create(name: name, username: user_name,
        password: password, email_address: different_email_address) }
      before do
        id = new_user.id
      end
      it 'returns duplicate user warning' do
        expect(second_user[:duplicate_user]).to be true
      end
      it 'does not add a user to the table' do
        user_count = DBConnection.query("Select count(*) as count from chitterer where username = '#{user_name}'")
        expect(user_count.first['count']).to eq '1'
      end

      context 'when trying to create a user with same email address' do

        let(:different_username) { 'hughy25' }
        let(:second_user) { described_class.create(name: name, username: different_username,
          password: password, email_address: email_address) }
        before do
          id = new_user.id
        end
        it 'returns duplicate email warning' do
          expect(second_user[:duplicate_email]).to be true
        end
        it 'does not add a user to the table' do
          user_count = DBConnection.query("Select count(*) as count from chitterer where email_address = '#{email_address}'")
          expect(user_count.first['count']).to eq '1'
        end
      end
    end

  end

  describe '.find_name' do
    context 'when fed an id that exists' do
      it 'returns the name of the user with that id' do
        expect(described_class.find_name(id)).to eq name
      end
    end
    context 'when fed a user id that does not exist' do
      it 'returns nil' do
        expect(described_class.find_name(0)).to be nil
      end
    end
    context 'when fed nil' do
      it 'returns nil' do
        expect(described_class.find_name(nil)).to be nil
      end
    end
  end

end
