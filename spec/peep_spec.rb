require 'peep'
require 'timecop'

describe Peep do

  time_created = Time.now
  Timecop.freeze(time_created)
  subject(:peep) { described_class.new("Hello world!", time_created) }
  Timecop.return

  context 'when initialized' do
    it 'takes a string parameter and assigns it to a "string" attribute' do
      expect(peep.string).to eq "Hello world!"
    end

    it 'takes a date and assigns it to its "date_created" attribute' do
      expect(peep.date_created).to eq time_created
    end
  end

  describe '::all' do
    it 'returns an array of Peep objects' do
      peeps = described_class.all
      strings = peeps.map(&:string)
      expect(strings).to include 'Today was a good day'
      expect(strings).to include 'Very important statement'
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
