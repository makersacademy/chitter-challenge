require 'peep'
describe Peep do

  describe '.all' do
    it 'adds a peep to the database' do
      peeps = Peep.all
      expect(peeps).to include 'Hello world!'
    end
  end

end