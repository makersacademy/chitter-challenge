require 'peep'

describe Peep do
  describe '#initialisation' do
    subject { described_class.new(id: '1', text: 'Peep 1', time: '12:34:56') }
    it "has an id" do
      expect(subject.id).to eq '1'
    end

    it "has text" do
      expect(subject.text).to eq 'Peep 1'
    end

    it "has a time" do
      expect(subject.time).to eq '12:34:56'
    end

    it "has a username" do
      expect(subject.username).to eq 'anonymous'
    end
  end
end
