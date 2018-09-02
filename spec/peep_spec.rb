require 'pg'

describe '.all' do
  it 'returns a list of peeps' do
    connection = PG.connect(dbname: 'chitter_test')
    connection.exec("INSERT INTO peeps (peep)VALUES('hello world!');")
    peeps = Peep.all
    expect(peeps.first.peep).to eq "hello world!"
  end
end