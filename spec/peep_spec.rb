require 'peep'

describe Peep do

describe '.all' do
  it 'returns a list of peeps' do
    connection = PG.connect(dbname: 'chitter_test')
    peep = Peep.create(peep: 'This is my first peep!', time_stamp: Time.now)
    peeps = Peep.all
    expect(peeps.length).to eq 1
    expect(peeps.first).to be_a Peep
    expect(peeps.first.peep).to include 'This is my first peep!' 
  end
end

describe '.create' do
  it 'creates a new peep' do
    Peep.create(peep: 'Test peep', time_stamp: Time.now)
    expect(Peep.all).to include "Test peep" 
  end
end

end