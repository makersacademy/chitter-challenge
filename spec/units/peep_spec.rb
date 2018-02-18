require 'peep'

describe Peep do
  describe '.all' do
    it "returns an array of peeps" do
      test_peep = "This is a test peep"
      expect(described_class.all).to include(include({ body: test_peep }))
    end
  end

  describe '.create' do
    it 'adds a peep to the list' do
      test_peep_2 = "This is another test peep"
      described_class.create(test_peep_2)
      expect(described_class.all).to include(include({ body: test_peep_2 }))
    end
  end
end
