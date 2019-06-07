require 'peep'

describe Peep do 

  it 'all method shows all the messages' do 
    peeps = Peep.all
    expect(peeps.first.text).to include 'Today is a great day! Ask me why...'
  end 

  it 'adds a peep to all and returns it' do 
    Peep.add(name: 'Lauren O', username: 'lilloz', text: 'new peep', date_time: DateTime.now)
    expect(Peep.all.first.text).to eq('new peep')
  end 
end 