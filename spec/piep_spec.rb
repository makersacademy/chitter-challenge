require_relative '../lib/piep.rb'

describe Piep do
  describe '.all' do
    it 'returns an array of piepjes' do
      array = Piep.all
      expect(array).to be_an_instance_of(Array)
      expect(array[0]).to be_an_instance_of(Piep)
    end
    it 'returns the piepjes in reverse chronological order' do
      expect(Piep.all[0].text).to eq('piepje2')
      expect(Piep.all[1].text).to eq('piepje1')
    end

  end

  describe '.create' do
    it 'creates a new entry in the piepjes database' do
      Piep.create('piepje3', 'user')
      expect(Piep.all[0].text).to eq('piepje3')
    end
  end

  describe '#text' do
    it 'returns the correct text' do
      piepje = Piep.all
      expect(piepje[0].text).to eq('piepje2')
    end
  end
end
