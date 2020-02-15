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

  describe '.all' do
    before do
      @peep = Peep.create(body: 'My first peep', username: 'lookupdaily')
      Peep.create(body: 'Welcome to my coding journey', username: 'lookupdaily')
      Peep.create(body: "I am going to peep about my learnings evereyday", username: 'lookupdaily')
      @peeps = Peep.all
    end

    it 'returns all peeps' do
      expect(@peeps.length).to eq 3
    end

    it 'returns Peep objects' do
      expect(@peeps.first).to be_a Peep
    end
    
    it 'returns the right information' do
      expect(@peeps.first.id).to eq @peep.id
      expect(@peeps.first.body).to eq 'My first peep'
      expect(@peeps.first.username).to eq 'lookupdaily'
    end

  end
end
