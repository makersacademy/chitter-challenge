require 'user'

describe '.create_user' do
  it 'can add a new user and password to a DB' do
    connection = PG.connect(dbname: 'peep_manager_test')
    connection.exec("TRUNCATE users;")
    connection.exec("INSERT INTO users VALUES(1, 'testuser', 'testpassword');")
    users = User.all_users
    expect(users.length).to eq(1)
    expect(users.first.username).to eq('testuser')
    expect(users.first.password).to eq('testpassword')
  end
end
