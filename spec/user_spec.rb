require 'user'
require 'reset_tables'

RSpec.describe User do
  before(:each) do 
    reset = ResetTables.new
    reset.reset_users_table
  end
  it 'return all users from the database' do
    expect(User.all_records[0][:email]).to eq('joehannis@gmail.com')
    expect(User.all_records[1][:email]).to eq('jakehannis@gmail.com')
  end
  it 'creates a new user and returns the table' do
    User.create_user('johnsmith', 'john@example.com', 'password123')
    expect(User.all_records[4][:email]).to eq('john@example.com')
  end

end
