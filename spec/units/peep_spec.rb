require 'peep'

describe 'Peep' do
  let(:connection) { PG.connect(dbname: 'chitter_manager_test') }

  it 'can add a peep text to the peeps table in the DB' do
    connection.exec("INSERT INTO peeps VALUES('1', 'Jayda is cool');")
    Peep.post('Testing, testing 1, 2, 3')
    query = connection.exec("SELECT content FROM peeps;")
    puts query.values
    expect(query.values[0]).to eq(['Jayda is cool'])

  end

end
