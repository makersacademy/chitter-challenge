require 'chitter'

describe Chitter do
  describe '#list_peeps' do
    it 'returns no peeps when none are posted on Chitter' do
      expect(subject.list_peeps).to be_empty
    end

    it 'returns a peep posted on Chitter' do
      subject.post("Hello world")
      expect(subject.list_peeps.first).to include('Hello world')
      expect(subject.peeps.size).to eq(1)
    end

    it 'returns all peeps posted on Chitter in reverse chronological order' do
      subject.post("Hello world1")
      subject.post("Hello world2")
      subject.post("Hello world3")
      subject.post("Hello world4")
      expect(subject.list_peeps.first).to include("Hello world4")
      expect(subject.list_peeps.last).to include("Hello world1")
      expect(subject.peeps.size).to eq(4)
    end
  end

  describe '.all' do
    it 'return all peeps' do
      peeps = Chitter.all

      expect(peeps).to include('Hello world 1')
      expect(peeps).to include('Hello world 2')
    end
  end
end