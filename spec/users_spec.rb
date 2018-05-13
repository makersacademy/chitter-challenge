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
      expect(Users.create(name, username, email, password, connection)).to eq(false)
    end
  end
end
