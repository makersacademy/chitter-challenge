require 'user'

describe User do
  let(:email) { 'peep.loverl337@booglemail.com' }
  let(:password) { 'verysecret123' }
  let(:name) { 'Shrimply Pibbles' }
  let(:username) { 'shrimplyp' }
  subject { User.new(email, name, username) }
  let(:connection) { double :database_connection, exec: tuple }
  let(:tuple) { double :a_tuple }

  describe '#self.create' do
    it 'calls insert command in SQL' do
      described_class.create(email, password, name, username, connection)
      expect(connection).to have_received(:exec).with("INSERT INTO users(email, password, name, username) VALUES('#{email}', '#{password}', '#{name}', '#{username}')")
    end
  end

  describe '#self.exists?' do
    context 'user exists' do
      before do
        allow(tuple).to receive(:ntuples).and_return(1)
      end

      it 'queries the database' do
        described_class.exists?(username, connection)
        expect(connection).to have_received(:exec).with("SELECT * FROM users WHERE username = '#{username}'")
      end

      it 'returns true if user exists' do
        expect(described_class.exists?(username, connection)).to be true
      end
    end

    context 'user does not exist' do
      it 'returns false if user does not exist' do
        allow(tuple).to receive(:ntuples).and_return(0)
        expect(described_class.exists?(username, connection)).to be false
      end
    end
  end

  describe '#self.correct_password?' do
    before do
      allow(tuple).to receive(:[]).and_return({ 'password' => password })
    end

    it 'queries the database' do
      described_class.correct_password?(username, password, connection)
      expect(connection).to have_received(:exec).with("SELECT * FROM users WHERE username = '#{username}'")
    end

    it 'returns true if password is correct' do
      expect(described_class.correct_password?(username, password, connection)).to be true
    end

    it 'returns false if the password is wrong' do
      allow(tuple).to receive(:[]).and_return({ 'password' => password })
      expect(described_class.correct_password?(username, 'wrong_password', connection)).to be false
    end
  end

  xdescribe '#self.select' do
    it 'queries the database' do
      described_class.select(username, connection)
      expect(connection).to have_received(:exec).with("SELECT email, name, username FROM users WHERE username = '#{username}'")
    end

    it 'returns an instance of user class' do
      allow(connection).to receive(:exec).and_return([{ 'email' => email, 'name' => name, 'username' => username }])
      described_class.select(username, connection)
    end
  end

  describe '#email' do
    it 'saves and returns an email' do
      expect(subject.email).to eq email
    end
  end

  describe '#name' do
    it 'saves and returns a name' do
      expect(subject.name).to eq name
    end
  end

  describe '#username' do
    it 'saves and returns a username' do
      expect(subject.username).to eq username
    end
  end
end
