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
    expect(Users.all.last).to include(:content => 'Hello chitter world')
  end
end

describe '#all' do
  it 'lists peeps in reverse chronological order' do
    connection = PG.connect :dbname => 'chitter_test'
    connection.exec("INSERT INTO messages (content) VALUES('Hello chitter world');")
    connection.exec("INSERT INTO messages (content) VALUES('This should be first');")
    expect(Users.all.first).to include(:content => 'This should be first')
  end
end
