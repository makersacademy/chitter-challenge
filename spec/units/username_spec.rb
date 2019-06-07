require 'username'

describe 'Username' do
  let(:connection)  { PG.connect(dbname: 'chitter_manager_test') }

  it 'adds a name to the user table in the DB' do
    connection.exec("INSERT INTO users VALUES(1,'Jayda');")
    Username.create('Mel')
    query = connection.exec("SELECT name FROM users;")
    expect(query.values[0]).to eq(['Jayda'])
    expect(query.values[1]).to eq(['Mel'])
  end

end
