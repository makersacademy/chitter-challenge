describe '.all' do
  it 'returns a list of peeps' do
    connection = PG.connect(dbname: 'chitter_test')

    connection.exec("INSERT INTO peeps (comment) VALUES ('Steak and eggs is the breakfast of champions!');")
    connection.exec("INSERT INTO peeps (comment) VALUES ('Dwayne Johnson does it again....');")
    connection.exec("INSERT INTO peeps (comment) VALUES ('Steve Buscemi has an odd autograph');")
    connection.exec("INSERT INTO peeps (comment) VALUES ('Set them free!');")

    peeps = Peeps.all

    expect(peeps).to include('Steak and eggs is the breakfast of champions!')
    expect(peeps).to include('Dwayne Johnson does it again....')
    expect(peeps).to include('Steve Buscemi has an odd autograph')
    expect(peeps).to include('Set them free!')
  end
end
