require 'peep'
describe Peep do
  let(:maker) { double :maker, id: 1 }

  describe '#create' do
    it 'gets created correctly in the chitter database' do
      peep = Peep.create(message: "This is a test peep", posted_by: maker.id)
      conn = PG.connect(dbname: 'chitter_test')
      result = conn.exec("SELECT * from peep where id = #{peep.id};").first
      expect(peep).to be_a Peep
      expect(result['message']).to eq "This is a test peep"
      expect(result['posted_by'].to_i).to eq maker.id
    end
  end

  describe '#all' do
    it 'returns all the peeps in the database' do
      peep = Peep.create(message: "This is a test peep", posted_by: maker.id)
      another_peep = Peep.create(message: "This is another test peep", posted_by: maker.id)
      result = Peep.all
      expect(result).to be_a Array
      expect(result.length).to eq 2
      expect(result.first).to be_a Peep
      expect(result.last).to be_a Peep
      expect(result.first.id.to_i).to eq another_peep.id
      expect(result.last.id.to_i).to eq peep.id
      expect(result.first.message).to eq another_peep.message
      expect(result.last.message).to eq peep.message
    end
  end
end
