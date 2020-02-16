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

  describe '.find' do
    let(:peep) { Peep.create(body: 'My first peep', username: 'lookupdaily') }
    let(:result) { Peep.find(id: peep.id) }

    it 'result is a Peep' do
      expect(result).to be_a Peep
    end

    it 'result has the same id as peep' do
      expect(result.id).to eq peep.id
    end

    it 'result is from the same user' do
      expect(result.username).to eq peep.username
    end

    it 'result has the same body as peep' do
      expect(result.body).to eq peep.body
    end

  end

  describe '.edit' do
    let(:peep) { Peep.create(body: 'My first peep', username: 'lookupdaily') }
    let(:updated_peep) { Peep.edit(id: peep.id, body: 'Hello World!') }

    it 'updated peep is a Peep' do
      expect(updated_peep).to be_a Peep
    end

    it 'updated peep has the same id as original peep' do
      expect(updated_peep.id).to eq peep.id
    end

    it 'updated peep has the same user' do
      expect(updated_peep.username).to eq peep.username
    end

    it 'result has the new body' do
      expect(updated_peep.body).to eq 'Hello World!'
    end

  end

end
