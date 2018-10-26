require './lib/chitter'

describe Chitter do

  it 'views an added peep' do
    Chitter.add(username: 'Becka', peep_time: "2018-10-26 15:45:19", text: 'My first peep')
    expect(Chitter.all.first).to be_a Chitter
    expect(Chitter.all.first.text).to eq 'My first peep'
  end

  it 'adds a second peep and views it' do
    Chitter.add(username: 'Becka', peep_time: "2018-10-26 15:55:19", text: 'My first peep')
    Chitter.add(username: 'Becka', peep_time: "2018-10-26 15:45:19", text: 'My second peep')
    expect(Chitter.all[1]).to be_a Chitter
    expect(Chitter.all[1].text).to eq 'My second peep'
  end

  it 'peeps have times' do
    Chitter.add(username: 'Becka', peep_time: "2018-10-26 15:05:19", text: 'My first peep')
    expect(Chitter.all.first.peep_time).to eq "2018-10-26 15:05:19"
  end

  it 'all returns peeps in reverse chronological order' do
    Chitter.add(username: 'Becka', peep_time: "2018-10-26 15:45:19", text: 'My middle peep')
    Chitter.add(username: 'Becka', peep_time: "2018-10-26 15:55:19", text: 'My newest peep')
    Chitter.add(username: 'Becka', peep_time: "2018-10-26 15:05:19", text: 'My oldest peep')
    chitters = Chitter.all
    expect(chitters.first.text).to eq "My newest peep"
    expect(chitters[1].text).to eq "My middle peep"
    expect(chitters.last.text).to eq "My oldest peep"
  end

end
