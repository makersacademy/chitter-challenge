require 'peep'

describe Peep do
  describe '.all' do
    it 'Returns all peeps in database' do
      peeps = Peep.all
      expect(peeps.length).to eq 0
    end
  end

  describe '.create' do
    it 'creates a new peep and adds it to the database' do
      Peep.create(content: 'This is my first peep')
      expect(Peep.all.length).to eq 1
    end
  end
end
