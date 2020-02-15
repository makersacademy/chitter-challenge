require 'peep'

describe Peep do
  describe '.create' do
    let(:peep) { Peep.create(body: 'My first peep', username: 'lookupdaily') }
    let(:persisted_data) { PG.connect(dbname: 'chitter_test').query("SELECT * FROM peeps WHERE id = #{peep.id};") }
    it 'creates a peep' do
      expect(peep).to be_a Peep
      expect(peep.body).to eq 'My first peep'
      expect(peep.username).to eq 'lookupdaily'
      expect(peep.id).to eq persisted_data.first['id']
    end
  end
end
