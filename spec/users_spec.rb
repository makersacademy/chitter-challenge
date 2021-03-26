require 'users'

describe Users do
  it 'responds to all' do
    expect(Users).to respond_to(:all)
  end
end

describe '#all' do
  it 'lists all chitters' do
    connection = PG.connect :dbname => 'chitter_test'
    connection.exec("INSERT INTO messages (content) VALUES('Hello chitter world');")
    expect(Users.all).to include("Hello chitter world")
  end
end
