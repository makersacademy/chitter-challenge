describe '.all' do
  it 'returns a list of peeps' do
    connection = PG.connect(dbname: 'peep_manager_test')

    # Add the test data
    connection.exec("INSERT INTO peeps (peep) VALUES ('Salut!');")
    connection.exec("INSERT INTO peeps (peep) VALUES('Ca farte?');")

    peeps = Peep.all

    expect(peeps).to include "Salut!"
    expect(peeps).to include "Ca farte?"
  end

  it 'returns a list of reversed peeps' do
    connection = PG.connect(dbname: 'peep_manager_test')

    # Add the test data
    connection.exec("INSERT INTO peeps (peep) VALUES ('Salut!');")
    connection.exec("INSERT INTO peeps (peep) VALUES('Ca farte?');")

    peeps = Peep.all

    expect(peeps.first).to eq "Ca farte?"
    expect(peeps.last).to eq "Salut!"
  end
end

describe '.create' do
  it 'creates a new peep' do
    Peep.create(peep: 'Kikoo!')

    expect(Peep.all).to include 'Kikoo!'
  end
end