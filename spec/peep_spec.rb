describe '.all' do
  it 'returns a list of peeps' do
    peeps = Message.all
    connection = PG.connect(dbname: 'peep_manager_test')

  peep = Message.create(  message:'United have won a game', title:'It is a miracle')
  Message.create(message: 'Rashford scored', title: 'Goalscorer')
  Message.create(message:'It finished 1-0', title: 'Final Score')

    # connection.exec("INSERT INTO peeps (peep) VALUES ('Welcome to Chitter');")
    # connection.exec("INSERT INTO peeps (peep) VALUES ('This is my first Peep');")
    # connection.exec("INSERT INTO peeps (peep) VALUES ('Peeping to my peeps');")

peeps = Message.all

expect(peeps.length).to eq 7
expect(peeps.first).to be_a Message
expect(peeps.first.id).to eq peep.id
expect(peeps.first.title).to eq 'It is a miracle'
expect(peeps.first.message).to eq 'United have won a game'

# expect(peeps).to include('Welcome to Chitter')
# expect(peeps).to include('This is my first Peep')
# expect(peeps).to include('Peeping to my peeps')
  end
end

describe '.create' do
  it "creates a new message" do
    message = Message.create(message:'Wish you were here', title: 'New tweet').first
    expect(message['message']).to eq 'Wish you were here'
    expect(message['title']).to eq 'New tweet'
  end
end
