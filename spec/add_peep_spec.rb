require 'peep'
require 'pg'

describe '.add' do
  it 'adds a peep' do
    peep = Peep.add(peep: 'me again', title: 'katie').first

    expect(Peep.all).to include 'me again'
    expect(peep['title']).to eq 'katie'
  end
end
