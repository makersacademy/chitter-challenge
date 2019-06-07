require 'peep'

describe Peep do 

  it 'creates a connection to PG with right db' do 
      expect(Peep.create_connection).to be_a(PG::Connection)
  end
  
  it 'sets up a connection to test database through PG' do 
    expect(PG).to receive(:connect).with(dbname: 'chitter_test')
    Peep.create_connection
  end 

  it 'all method shows all the messages' do 
    peeps = Peep.all
    expect(peeps.first.text).to include 'Today is a great day! Ask me why...'
  end 

  it 'adds a peep to all and returns it' do 
    Peep.add(name: 'Lauren O', username: 'lilloz', text: 'new peep', date_time: DateTime.now)
    expect(Peep.all.first.text).to eq('new peep')
  end 
end 