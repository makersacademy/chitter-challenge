require 'peep'
require 'database_helper'

describe Peep do
  let(:new_peep) { Peep.new(1, 'I have eaten way too many brownies! Help!')}

  it 'initializes a peep with an id and a body' do
    expect(new_peep.id).to eq 1
    expect(new_peep.body).to eq 'I have eaten way too many brownies! Help!'
  end

  describe '.all' do
    it 'returns all peeps' do
      connection = PG.connect(dbname: 'chitter_test')
      result = connection.exec("INSERT INTO peeps (id, body) VALUES(1, 'I have eaten way too many brownies! Help!') RETURNING id, body;")
	    Peep.new(result[0]['id'],result[0]['body'])
      peep = Peep.all

      expect(peep.length).to eq 1
      expect(peep.first).to be_a Peep
      expect(peep.first.id).to eq '1'
      expect(peep.first.body).to eq 'I have eaten way too many brownies! Help!'

    end
  end
end
