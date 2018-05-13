require 'user'

describe User do
  let(:email) { 'peep.loverl337@booglemail.com' }
  let(:password) { 'verysecret123' }
  let(:name) { 'Shrimply Pibbles' }
  let(:username) { 'shrimplyp' }
  let(:connection) { double :database_connection, exec: [
    {
      'email' => email,
      'password' => password,
      'name' => name,
      'username' => username
      } ] }

  describe '#self.create' do
    it 'calls insert command in SQL' do
      described_class.create(email, password, name, username, connection)
      expect(connection).to have_received(:exec).with("INSERT INTO users(email, password, name, username) VALUES('#{email}', '#{password}', '#{name}', '#{username}')")
    end
  end
end
