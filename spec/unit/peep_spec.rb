require_relative '../../lib/peep'

describe Peep do
  context "#self.establish" do
    it 'is called on the Peep class' do
      expect(described_class).to respond_to(:establish_connection)
    end

    it 'Establishes connection to the chitter database' do
      expect(described_class.establish_connection).not_to eq(nil)
    end
  end

  context "#self.post_peep" do
    it 'is called on the Peep class' do
      expect(described_class).to respond_to(:post_peep).with(1).argument
    end

    it 'stores a peep into the peep table of the chitter database' do
      described_class.establish_connection

    end
  end
end