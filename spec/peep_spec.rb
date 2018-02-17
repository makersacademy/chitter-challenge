require './lib/peep'

describe Peep

  describe '.all' do
    it 'returns all peeps from the database' do
      peeps = Peep.all
      authors = peeps.map(&:author)
      expect(authors).to include("Justyna")
    end
  end

  describe '.create' do
    it 'returns all peeps from the database' do
      Peep.create("test", "testow")
      peeps = Peep.all
      texts = peeps.map(&:text)
      expect(texts).to include("test")
    end
  end
