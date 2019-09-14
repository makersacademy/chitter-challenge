require 'features/web_helpers'
require 'peep'

describe Peep do

  describe '#self.create' do
    it 'creates a new Peep entry in peep DB' do
    peep = Peep.create(content: 'Big day at the football')
    expect(peep).to be_a Peep
    expect(peep.content).to eq 'Big day at the football'
    expect(peep.id).to be_a String
    expect(peep.time).to be_a String
    end
  end

  describe '#self.all' do
    it 'returns a PG::Result with all the peeps from table' do
    peep = Peep.create(content: 'Big day at the football')
    peeps = Peep.all
    expect(peeps.last.content).to eq('Big day at the football')
    end
  end
end