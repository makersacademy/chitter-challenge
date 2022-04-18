require 'chitter'

describe Chitter do
   it 'return all the peeps' do
    peeps = Chitter.all

    expect(peeps).to include("how are you?")
    expect(peeps).to include("Let us discuss")
  end
  context 'adding a new peep' do
    it 'lets a user to post a new peep on chitter' do
      peep = Chitter.add('Hello')
      expect(peep).to eq 'Hello'
    end
  end 
end
