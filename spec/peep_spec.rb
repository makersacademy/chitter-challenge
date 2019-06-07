require 'peep'

describe Peep do 

  it 'all method shows all the messages' do 
    peeps = Peep.all
    expect(peeps.first.text).to include 'Today is a great day! Ask me why...'
  end 

  it 'adds a peep to all and returns it' do 
    Peep.add(user_id:1, text: 'new peep', date_time: DateTime.now)
    peeps = Peep.all
    expect(peeps[0].text).to eq('new peep')
  end 
end 