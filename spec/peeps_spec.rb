require 'peeps'

describe '.all' do 
  it 'returns a list of peeps' do 
    peeps = Peeps.all

    expect(peeps).to include "This is my first peep on Chitter!"
    expect(peeps).to include "I am an example."
  end 
end 
