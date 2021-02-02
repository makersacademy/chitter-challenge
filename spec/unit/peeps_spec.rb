require './lib/peeps'

describe Peeps do

  describe 'self.create' do
    it 'creates a new Peep entry in chitter database' do
      peep = Peeps.create('Big day at Makers')
      expect(peep).to be_a PG::Result
    end
  end
end

begin
  describe 'self.all' do
    it 'returns a PG::Result ll the peeps from peeps table in chitter database' do
      Peeps.create('Big day at Makers')
      peeps = Peeps.all
      expect(peeps).to include('Big day at Makers')
    end
  end
end

