require 'peep'
require 'timecop'

describe Peep do

  subject(:peep) { described_class.new("Hello world!") }

  context 'when initialized' do
    it 'takes a string parameter and assigns it to a "string" attribute' do
      expect(peep.string).to eq "Hello world!"
    end
  end

  describe '#timestamp' do
    it "stores the peep's time of creation" do
      new_time = Time.now
      Timecop.freeze(new_time)
      expect(peep.timestamp).to eq new_time
      Timecop.return
    end
  end

  describe '::all' do
    it 'returns an array of Peep objects' do
      peeps = described_class.all
      strings = peeps.map(&:string)
      expect(strings).to include 'Today was a good day'
    end
  end

  describe '::create' do
    it 'adds a peep to the database' do
      described_class.create('Hello world!')
      peeps = described_class.all
      strings = peeps.map(&:string)
      expect(strings).to include 'Hello world!'
    end
  end

end
