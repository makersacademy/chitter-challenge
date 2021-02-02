require './lib/peeps'

describe Peeps do

  describe 'self.create' do
    it 'creates a new Peep entry in peep DB' do
      peep = Peeps.create(content: 'Big day at Makers')
      expect(peep).to be_a Peep
      expect(peep.content).to eq 'Big day at Makers'
    end
  end
end

=begin
  describe 'self.all' do
    it 'returns a PG::Result with all the peeps from table' do
      connection = PG.connect(dbname: 'chiiter')
      peeps = Peeps.all
      expect(peeps.last.content).to eq('Big day at Makers')
    end
  end
end
=end

