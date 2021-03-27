require 'database_helper'

describe '.persisted_data' do
  it 'returns id' do
    connection = PG.connect(dbname: 'chitter_test')
    result = connection.exec("INSERT INTO peeps (id, body) VALUES(1, 'I have eaten way too many brownies! Help!') RETURNING id, body;")
    peep = Peep.new(result[0]['id'],result[0]['body'])
    persisted_data = persisted_data(id: peep.id)

    expect(peep.id).to eq '1'
  end
end
