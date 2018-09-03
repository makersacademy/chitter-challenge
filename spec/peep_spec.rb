require 'peep'
describe Peep do

  describe '.add' do
    it 'adds a peep and the time that the peep was posted' do
      described_class.add(nil,'Test peep 1')
      described_class.add('Test peep 2')
      described_class.add('Test peep 3')

      test_peep_1 = described_class.all.first
      expect(test_peep_1).to be_a Peep
      expect(test_peep_1).to respond_to(:date)
      expect(test_peep_1).to respond_to(:time)
    end
  end

end
