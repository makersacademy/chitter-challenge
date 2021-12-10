require 'peep'

describe Peep do
  describe '.create' do
    it 'creates a peep which we can then view' do 
      peep = Peep.post(text: 'Make America Great Again', user: 'Donald Trump', handle: 'POTUS')
      expect(peep.text).to eq 'Make America Great Again'
      expect(peep.user).to eq 'Make America Great Again'
      expect(peep.handle).to eq 'Make America Great Again'
    end
  end
end