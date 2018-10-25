require 'chitter'
require 'pg'

describe Chitter do

  it 'lists all peeps' do
    Chitter.create_peep('Imogen Misso', 'imogenmisso123', 'My first peep')
    Chitter.create_peep('Diane Misso', 'diane123', 'Checking')
    peeps = Chitter.all
    expect(peeps.length).to eq 2
    expect(peeps.first.name).to eq 'Diane Misso'
    expect(peeps.first.text).to eq 'Checking'
  end

  it 'allows user to post a peep' do
    Chitter.create_peep('Imogen Misso', 'imogenmisso123', 'My first peep')
    peeps = Chitter.all
    expect(peeps[0].text).to eq 'My first peep'
  end

end
