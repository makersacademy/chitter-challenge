require 'user'

describe User do
  let(:email) { 'peep.loverl337@booglemail.com' }
  let(:password) { 'verysecret123' }
  let(:connection) { double :database_connection, exec: [
    { 'email' => email, 'password' => password },
    ] }

  describe '#self.create' do
    it 'calls insert command in SQL' do
      described_class.create(email, password, connection)
      expect(connection).to have_received(:exec).with("INSERT INTO users(email, password) VALUES('#{email}', '#{password}')")
    end
  end
end
