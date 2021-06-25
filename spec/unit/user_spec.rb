require 'user'

describe User do
  before(:each) do
    @connection = PG.connect(dbname: 'users_test')
    @connection.exec('TRUNCATE TABLE users;')
  end

  it 'adds a user to the database' do
    # user = User.new(id: 1, name: 'John', email: 'john@Gmail.com', password: '123', dob: '1993-05-20')
    user = User.sign_up(name: 'John', email: 'john@gmail.com', password: '123', dob: '1993-05-20')
    p "user name"
    p user[0]
    expect(user[0]['name']).to eq('John')
  end
end
