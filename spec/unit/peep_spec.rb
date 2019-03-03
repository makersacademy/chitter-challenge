require 'peep'

describe Peep do
  it 'Stores a new peep when initialized and returns it when passed all' do
    Peep.new('This is an example peep')
    expect(Peep.all[0]['peep']).to eq 'This is an example peep'
  end
end
