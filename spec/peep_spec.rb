require 'peep'

describe Peep do

  describe '.all' do
    it 'allows a user to view all peeps' do
      Peep.create(peeps: 'This is my peep' )
      Peep.create(peeps: 'This is my second peep' )
      Peep.create(peeps: 'This is my third peep' )

      chitter = Peep.all

      expect(chitter.last.peeps).to include('This is my peep')
      # expect(chitter.peeps).to include('This is my second peep')
      expect(chitter.first.peeps).to include('This is my third peep')
    end
  end

  # describe '.create' do
  #   it 'allows user to create peeps' do
  #     Peep.create(peeps: 'new peep')
  #
  #     expect(Peep.all).to include('new peep')
  #   end
  # end

end
