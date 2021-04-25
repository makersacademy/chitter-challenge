require 'peeps'

describe Peeps do

  describe '#new' do
    # As a Maker
    # So that I can let people know what I am doing  
    # I want to post a message (peep) to chitter
    it 'creates a new peep' do
      Peeps.new('Really long text...')

      expect(Peeps.all[0]).to include('Really long text...')
    end
  end

  describe '#all' do 
    # As a maker
    # So that I can see what others are saying
    # I want to see all peeps in reverse chronological order
    it 'shows all peeps' do
      5.times { Peeps.new('Really long text...') }
      expect(Peeps.all.length).to eq 5
    end

    it 'shows newest peeps first' do
      Peeps.new('Oldest Message')
      Peeps.new('Newest Message')

      expect(Peeps.all[0]).to include('Newest Message')
    end

  end

end
