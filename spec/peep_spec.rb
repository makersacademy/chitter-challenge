require 'peep'

describe '.all_peeps' do
  it 'returns a list of peeps' do
    connection = PG.connect(dbname: 'peep_manager_test')
    connection.exec("TRUNCATE peeps;")
    connection.exec("INSERT INTO peeps VALUES(1, 'FIRST PEEP');")
    connection.exec("INSERT INTO peeps VALUES(2, 'SECOND PEEP');")
    peeps = Peep.all_peeps
    expect(peeps.length).to eq(2)
    expect(peeps.first.content).to eq('SECOND PEEP')
    expect(peeps.last.content).to eq('FIRST PEEP')
  end
end
