require 'user'

describe User do
  before(:each) do
    @connection = PG.connect(dbname: 'users_test')
    @connection.exec('TRUNCATE TABLE users;')
  end

  it 'adds a user to the database' do
    user = User.sign_up(name: 'John', email: 'john@gmail.com', password: '123', dob: '1993-05-20')
    expect(user[0]['name']).to eq('John')
  end

  # it 'logs in when correct details submitted' do
  #   User.sign_up(name: 'John', email: 'john@gmail.com', password: '123', dob: '1993-05-20')
  #   user = User.log_in(email: 'john@gmail.com', password: '123')

  #   expect()
  # end
end
