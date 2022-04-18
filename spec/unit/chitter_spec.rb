require 'chitter'

describe Chitter do
  context 'adding a new peep' do
    it 'lets a user to post a new peep on chitter' do
      peep = Chitter.add('Hello')
      expect(peep).to eq 'Hello'
   end
  end 
end