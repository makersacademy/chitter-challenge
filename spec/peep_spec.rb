require 'peep'

describe '.all' do
  it 'returns a list of saved peeps' do
    peeps = Peep.all

    # expect(peeps).to include "Raindrops on roses"
    # expect(peeps).to include "and"
    # expect(peeps).to include "whiskers on kittens"
  end
end
