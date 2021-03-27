require 'peep'
require 'database_helper'

describe Peep do
  let(:new_peep) { Peep.new(1, 'I have eaten way too many brownies! Help!', 'time')}

  it 'initializes a peep with an id and a body' do
    expect(new_peep.id).to eq 1
    expect(new_peep.body).to eq 'I have eaten way too many brownies! Help!'
  end

  it 'has a timestamp' do

  end

  describe '.all' do
    it 'returns all peeps' do
      connection = PG.connect(dbname: 'chitter_test')
      result = connection.exec("INSERT INTO peeps (id, body, time) VALUES(1, 'I have eaten way too many brownies! Help!', '#{Time.now.strftime('%a, %d %b %Y %H:%M:%S')}' ) RETURNING id, body, time;")
	    Peep.new(result[0]['id'],result[0]['body'], result[0]['time'])
      peep = Peep.all

      expect(peep.length).to eq 1
      expect(peep.first).to be_a Peep
      expect(peep.first.id).to eq '1'
      expect(peep.first.body).to eq 'I have eaten way too many brownies! Help!'

    end
  end

  describe '.add' do
    it 'adds a new peep' do
	    peep = Peep.add('testing123')
	    persisted_data = persisted_data_peeps(id: peep.id)

	    expect(peep).to be_a Peep
	    expect(peep.id).to eq persisted_data['id']
	    expect(peep.body).to eq 'testing123'
    end
  end
end
