require 'peep.rb'

describe Peep do

  let(:db) { connect('chitter_test') }
  let(:peep1) { 'first peep' }
  let(:peep2) { 'second peep' }
  let(:peep3) { 'third peep' }

  describe '::all' do
    it 'returns a list of peeps' do
      add_peeps(peep1, peep2, peep3)
      contents = db.exec("SELECT * FROM peeps;").to_a
      described_class.all.each_with_index { |peep, index|
        expect(peep.id).to eq contents[index]['id']
        expect(peep.text).to eq contents[index]['text']
        expect(peep.timestamp).to eq contents[index]['created_at']
      }
    end
  end
  
  describe '::create' do
    it 'creates a peep' do
      
    end
  end

  describe '::delete' do
    it 'deletes a peep' do
      
    end
  end
  
  describe '::update' do
    it 'updates a peep' do
      
    end
  end
end