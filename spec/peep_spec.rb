require 'peep'

describe Peep do
  let(:formatted_time) { Time.now.strftime('%d %b %Y, %H:%M') }

  before do
    add_peeps_to_test_database
  end

  describe '::all' do
    it 'should return peeps' do
      peep = described_class.all.first
      expect(peep).to be_a Peep
      expect(peep.text).to eq 'My first peep'
      expect(peep.id).to eq '1'
      expect(peep.time).to eq formatted_time
    end
  end

  describe '::create' do
    it 'should enter a peep into the database' do
      result = described_class.create('My fourth peep').first
      expect(result['id']).to eq '4'
      expect(result['text']).to eq 'My fourth peep'
    end

    it 'should return the formatted current time as the peep entry time' do
      result = described_class.create('My first peep').first
      expect(result['time']).to eq formatted_time
    end
  end
end
