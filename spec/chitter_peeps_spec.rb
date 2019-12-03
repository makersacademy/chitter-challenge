require 'chitter_peeps'

describe Chitter_peeps do
  describe '#initialize' do
    it 'stores a peep' do
      peep = Chitter_peeps.new(:peep)
      expect(peep.peep).to eq(:peep)
    end
  end

  it 'shows a list of all peeps' do
    Chitter_peeps.create(peep: 'Hello new peeps, what is up')
    peep = Chitter_peeps.all
    new_peeps = peep.last
    expect(new_peeps.peep).to eq('Hello new peeps, what is up')
  end

  describe '.create' do
    it 'creates a peep' do
      Chitter_peeps.create(peep: 'Hello, friends this is my first peep')
      peep = Chitter_peeps.all
      new_peeps = peep.last
      expect(new_peeps.peep).to eq 'http://www.superdrug.com'
    end
  end

end
