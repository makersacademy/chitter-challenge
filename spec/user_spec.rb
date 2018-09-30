require 'user'

describe User do
  let(:database) { DBHelper.connect_to_db }
  let(:username) { 'Test' }
  let(:email) { 'test@test.com' }

  describe '.add' do
    it 'adds a user to the database' do
      expect{ User.add(username, email) }.to change { database.exec('SELECT username FROM users').count }.by(1)
      expect(database.exec('SELECT username FROM users').first).to eq({'username' => username})
      expect(database.exec('SELECT email FROM users').first).to eq({'email' => email})
    end

    it 'returns a success message when a user is added to the database' do
      expect(User.add(username, email)).to eq('success')
    end

    it 'does not let you add the same username twice' do
      User.add(username, email)
      expect { User.add(username, 'test2@test.com') }.to change { database.exec('SELECT username FROM users').count }.by(0)
    end

    it 'does not let you add the same email twice' do
      User.add(username, email)
      expect { User.add('Test2', email) }.to change { database.exec('SELECT email FROM users').count }.by(0)
    end

    it 'returns an error when username is already in the database' do
      User.add(username, email)
      expect(User.add(username, 'test2@test.com')).to eq('fail')
    end

    it 'returns an error when email is already in the database' do
      User.add(username, email)
      expect(User.add('Test2', email)).to eq('fail')
    end
  end
end