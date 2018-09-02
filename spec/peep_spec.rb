require 'peep'
describe Peep do

  describe '.add' do
    it 'adds a peep and the time that the peep was posted' do
      described_class.add('What time is it?')
      expect(described_class.all).to include  "What time is it? #{Time.now.strftime("%m/%d/%Y")}"
    end
  end

end
