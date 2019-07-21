require './app/models/peep.rb'

describe "#post" do
  it "Should allow user to post a peep" do
    peep = Peep.post(message: 'This is my first peep')
    connection = PG.connect(dbname: 'chitter_test')
    result = connection.exec('SELECT message_text FROM peeps;').first

    expect(peep).to be_a Peep
    expect(peep.id).to eq result['id']
    expect(peep.text).to eq result['message_text']
    end
  end
