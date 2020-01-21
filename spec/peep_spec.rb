require 'peep'

describe Peep do
  it 'tests successfully connect to chitter_manager_test' do
    connection = PG.connect(dbname: 'chitter_manager_test')

    expect { connection.exec("INSERT INTO peeps VALUES(1, 'My first peep');") }.not_to raise_error
  end

  describe '.create' do
    it 'saves a peep in Chitter Manager' do
      peep = Peep.create('My new peep')

      expect(peep).to be_a Peep
      expect(peep.message).to include 'My new peep'
    end
  end

  describe '.all' do
    it 'returns a list of peeps from Chitter Manager' do
      Peep.create('My first peep')
      Peep.create('My second peep')
      Peep.create('My third peep')

      peeps = Peep.all

      expect(peeps.length).to eq 3
      expect(peeps.first.message).to eq 'My first peep'
    end
  end

  describe '.all_reverse_chronological_order' do
    it 'returns a list of peeps in reverse chronological order' do
      firs_peep = Peep.create('My first peep')
      second_peep = Peep.create('My second peep')

      peeps = Peep.all_reverse_chronological_order

      expect(peeps.first.id).to eq second_peep.id
      expect(peeps.first.message).to eq second_peep.message
      expect(peeps.first.time).to eq second_peep.time
    end
  end
end
