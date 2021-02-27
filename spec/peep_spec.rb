require 'peep'

describe Peep do
  describe '.all' do
    it 'returns all peeps' do
      peep = Peep.create(content: 'Hello world!')
      Peep.create(content: 'Hello Makers!')
      Peep.create(content: 'Hello Cheese!')

      peeps = Peep.all
      expect(peeps.length).to eq 3
      expect(peeps.first).to be_a Peep
      expect(peeps.first.content).to eq 'Hello world!'
    end
  end

  describe '.create' do
    it 'creates a Peep after adding a peep to the database' do
      peep = Peep.create(content: 'Hello!')

      expect(peep).to be_a Peep
      expect(peep.content).to eq 'Hello!'
    end
  end
end
