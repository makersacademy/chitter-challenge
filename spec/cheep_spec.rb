require 'cheep'

describe Cheep do
  describe '.post' do
    it 'should add a cheep to a db when called' do
      result = Cheep.post('Test Post String')
      expect(result.post).to eq 'Test Post String'
      expect(result.id).to eq '1'
    end
  end
  describe '.all' do
    it 'should return array of all cheeps when called in reverse order' do
      cheep1 = Cheep.post('Test Post String 1')
      cheep2 = Cheep.post('Test Post String 2')
      cheeps = Cheep.all
      expect(cheeps[0].post).to eq cheep2.post
      expect(cheeps[1].post).to eq cheep1.post
    end
  end
  describe '.cheep_from_db_query' do
    let(:timestamp) { double :timestamp, db_datetime_format: '31/03/2019 17:59:17' }

    it 'should create a cheep object from a db query result' do
      cheep = Cheep.cheep_from_db_query(q_result: { 'id' => '1', 'post' => 'Test Post 1', 'datetime' => '2019-03-31 17:59:17.887993+01' }, timestamp_class: timestamp)
      expect(cheep.post).to eq 'Test Post 1'
      expect(cheep.id).to eq '1'
      expect(cheep.timestamp).to eq '31/03/2019 17:59:17'
    end
  end
end
