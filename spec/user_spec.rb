require 'user'
require 'pg'


describe User do
  subject { described_class.new("email@gmail.com", "password", "Lisa", "@lisa") }

  describe 'email' do
    it 'returns the user\'s email' do
      expect(subject.email).to eq "email@gmail.com"
    end
  end

  describe 'password' do
    it 'returns the user\'s password' do
      expect(subject.password).to eq "password"
    end
  end

  describe 'name' do
    it 'returns the user\'s name' do
      expect(subject.name).to eq "Lisa"
    end
  end

  describe 'username' do
    it 'returns the user\'s username' do
      expect(subject.username).to eq "@lisa"
    end
  end

  describe '#add_user' do
    it 'adds the user\'s details to the database' do
      con = PG.connect(dbname: 'chitter_test')
      result = con.exec("INSERT INTO peeps (email, password, name, username) VALUES('lisa@gmail.com', 'password', 'Lisa', '@lisa') RETURNING email, password, name, username;")
      result = con.query("SELECT DISTINCT email, password, name, username FROM peeps;")
      result.map do |user|
        User.new('email', 'password', 'name', 'username')
      end


	    expect(result[0]).to eq "email"=>"lisa@gmail.com", "password"=>"password", "name"=>"Lisa", "username"=>"@lisa"
	  end
  end
end
