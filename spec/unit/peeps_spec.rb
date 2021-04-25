require 'peeps'


describe Peeps do

  describe '#new' do
    # As a Maker
    # So that I can let people know what I am doing  
    # I want to post a message (peep) to chitter
    it 'creates a new peep' do
      peep = Peeps.new('Really long text...')
      chitter = Peeps.all

      expect(chitter).to include('Really long text...')
    end
  end

  describe '#all' do 
    it 'shows all peeps' do
      5.times {Peeps.new('Really long text...')}

      expect(Peeps.all.size).to eq(5)
    end
  end


end