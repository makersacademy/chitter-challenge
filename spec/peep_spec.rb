require './lib/peep'

describe Peep

  describe '.all' do
    it 'returns all peeps from the database' do
      peeps = Peep.all
      p peeps
      authors = peeps.map(&:author)
      expect(authors).to include("Justyna")
    end
  end
