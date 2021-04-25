require 'peeps'


describe Chitter do
# As a Maker
# So that I can let people know what I am doing  
# I want to post a message (peep) to chitter

  describe '#all' do 
    it 'shows all peeps' do
      chitter = Peeps.all

      expect(chitter).to include('Really long text...')
    end

  end

end