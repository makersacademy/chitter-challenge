describe '.all' do
  it 'returns a list of peeps' do
    connection = PG.connect(dbname: 'chitter_test')

    # Add the test data
    connection.exec("INSERT INTO peeps (peep) VALUES ('Test peep 1');")
    connection.exec("INSERT INTO peeps (peep) VALUES('Test peep 2');")
    connection.exec("INSERT INTO peeps (peep) VALUES('Test peep 3');")

    peeps = Peep.all

    expect(peeps).to include('Test peep 1')
    expect(peeps).to include('Test peep 2')
    expect(peeps).to include('Test peep 3')
  end
end
