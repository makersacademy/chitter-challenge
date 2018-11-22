require 'peep'

describe '.all_peeps' do
  it 'returns a list of peeps' do
    connection = PG.connect(dbname: 'peep_manager_test')
    connection.exec("TRUNCATE peeps;")
    connection.exec("INSERT INTO peeps VALUES(1, 'TEST1');")
    connection.exec("INSERT INTO peeps VALUES(2, 'TEST2');")
    peeps = Peep.all_peeps
    expect(peeps.length).to eq(2)
    expect(peeps.first).to eq('TEST1')
    expect(peeps.last).to eq('TEST2')
  end
end
