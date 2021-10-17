require 'peep'

describe Peep do
  describe '.create' do
    it 'allows you to create new Peeps' do
      peep = Peep.create(content: 'I am a great Peep')
      expect(peep.content).to eq 'I am a great Peep'
    end 
  end 
end