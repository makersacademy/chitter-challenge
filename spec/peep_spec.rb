require 'peep'

describe Peep do
  describe '.all' do
    it 'returns an array' do
      expect(Peep.all).to be_a(Array)
    end
    it 'shows all peeps in reverse chronological order' do
      peeps = Peep.all
      res = peeps.map(&:ts)
      first_ts, last_ts = Time.parse(res.first), Time.parse(res.last)
      expect(first_ts > last_ts).to eq(true)
    end
    it 'shows all peeps' do
      peeps = Peep.all
      res = peeps.map(&:txt)
      expect(res).to include("0th")
      expect(res).to include("1st")
      expect(res).to include("2nd")
    end
  end

  describe '.create' do
    it 'creates a new peep' do
      Peep.create(txt: 'New')
      peeps = Peep.all
      res = peeps.map(&:txt)
      expect(res).to include 'New'
    end
  end
end
