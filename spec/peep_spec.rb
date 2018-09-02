require 'peep'
describe Peep do

  describe '.add' do
    it 'adds a peep and the time that the peep was posted' do
      described_class.add('What time is it?')
      expected_output =  "What time is it? #{Time.now.strftime("%m/%d/%Y")} #{Time.new.strftime("%H:%M%p")}"
      expect(described_class.all).to include expected_output
    end
  end

end
