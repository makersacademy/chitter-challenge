require './lib/peep'

describe Peep

  describe '.all' do
    it 'returns all peeps from the database' do
      peeps = Peep.all
      authors = peeps.map(&:author)
      expect(authors).to include("Justyna")
    end

    # describe 'sorts all peeps by date' do
    #   peeps = Peep.sort
    #   dates = peeps.map(&:date)
    #   expect(dates).to include(["2018-05-17 13:30:30", "2018-02-17 15:54:04"])
    # end

  end
