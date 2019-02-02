require 'message'

describe '.display' do
  it 'displays a messages' do
    connection = PG.connect(dbname: 'chitter_challenge_test')
    connection.exec("INSERT INTO chitter (message) VALUES('My message one');")
    connection.exec("INSERT INTO chitter (message) VALUES('My message two');")
    messages = Message.display
    expect(messages).to include('My message one')
    expect(messages).to include('My message two')
  end

end

describe '.create' do
  it 'creates a new message' do
    tweet = Message.create(message:'My new message')
    expect(tweet).to be_a Message
    expect(tweet.message).to eq('My new message')
  end
end
