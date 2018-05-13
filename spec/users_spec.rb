require 'users'

describe Users do
  let(:connection) { double :connection, exec: nil }
  let(:name) { 'Beyonce Knowles' }
  let(:username) { 'Yoncé' }
  let(:email) { 'queenb@gmail.com' }
  let(:password) { 'lemonade' }

  describe '#create' do
    it 'returns SQL message with the arguments' do
      expect(connection).to receive(:exec).with("INSERT INTO users(name, username, email, password) VALUES('Beyonce Knowles', 'Yoncé', 'queenb@gmail.com', 'lemonade')")
      Users.create(name, username, email, password, connection)
    end

    it 'should return false if username is already taken' do
      allow(Users).to receive(:username_available?).with('Yoncé') {false}
      expect(Users.create(name, username, email, password, connection)).to eq('username error')
    end

    it 'should return false if email is already is use' do
      allow(Users).to receive(:email_available?).with('queenb@gmail.com') {false}
      expect(Users.create(name, username, email, password, connection)).to eq('email error')
    end
  end
end
