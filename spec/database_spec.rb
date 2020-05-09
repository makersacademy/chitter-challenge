require 'database_scripts'

describe 'add_person' do 
  it 'adds person to db' do
    add_person('Patty', 'Pat Sawyer', 'pat@pat.com', 'password')
    connection = PG.connect :dbname => 'chitter_test'
    response = connection.exec "SELECT real_name, user_handle, email, password FROM users WHERE user_handle = 'Patty'"
    expect(response[0]['real_name']).to eq 'Pat Sawyer'
    expect(response[0]['user_handle']).to eq 'Patty'
    expect(response[0]['email']).to eq 'pat@pat.com'
    expect(response[0]['password']).to eq 'password'
  end
end

describe 'get_person' do 
  it 'returns correct person object when correct password given' do 
    expect(get_person('Jim1984', 'password')).to be_a Person
    expect(get_person('Jim1984', 'password').real_name).to eq 'Jimmy'
    expect(get_person('Jim1984', 'password').email).to eq 'test@test.com'
  end

  it 'returns nil when wrong password given' do
    expect(get_person('Jim1984', 'wrong_password')).to eq nil
  end
end

describe 'addpeep' do 
  it 'adds peep to db' do
    addpeep('testing123', 'jimmysmith', 'jim smith')
    connection = PG.connect :dbname => 'chitter_test'
    response = connection.exec "SELECT * FROM peeps WHERE user_handle = 'jimmysmith'"
    expect(response[0]['body']).to eq 'testing123'
  end
end

describe 'getpeeps' do
  it 'retrieves peep data' do
    connection = PG.connect :dbname => 'chitter_test'
    response = connection.exec "SELECT * FROM peeps"
    response.each do |peep|
      expect(peep['user_handle']).to eq 'Jim1984'
      expect(peep['body']).to include 'test'
    end
  end
end

describe 'time_since' do
  it 'returns string with 0 minutes' do
    expect(time_since(Time.now.to_s)).to eq "Posted 0 minutes ago."
  end
end
