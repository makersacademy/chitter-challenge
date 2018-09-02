require 'peep'
describe Peep do

  describe '.all' do
    it 'adds a peep to the database' do
      expect(described_class.all).to include 'First peep'
    end
  end

end