require 'peep'

describe Peep do
  describe '::all' do
    it 'should return a list of peeps' do
      expect(described_class.all.first).to eq 'My first peep'
    end
  end

  describe '::create' do
    it 'should enter a peep into the database' do
      formatted_time = Time.now.strftime('%d %b %Y, %H:%M')
      result = described_class.create('My first peep').first
      expect(result['id']).to eq '1'
      expect(result['text']).to eq 'My first peep'
      expect(result['time']).to eq formatted_time
    end
  end
end
