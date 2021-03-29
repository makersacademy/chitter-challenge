require 'security'

describe Security do
  it 'responds to username' do
    expect(Security).to respond_to(:username)
  end
end

describe '#username' do
  it 'returns the username' do
    connection = PG.connect :dbname => 'chitter_test'
    connection.exec("INSERT INTO security (username) VALUES('Arsene Lupin');")
    expect(Security.username).to include("Arsene Lupin")
  end
end

describe '#password' do
  it 'returns the password' do
    connection = PG.connect :dbname => 'chitter_test'
    connection.exec("INSERT INTO security (password) VALUES('OmarSy');")
    expect(Security.password).to include(:password => "OmarSy")
  end
end

describe '#signup' do
  it 'allows the user to sign up' do
    connection = PG.connect :dbname => 'chitter_test'
    Security.sign_up("Arsene Lupin", "OmarSy")
    expect(Security.username).to include("Arsene Lupin")
    expect(Security.password).to include(:password => "OmarSy")
  end
end
