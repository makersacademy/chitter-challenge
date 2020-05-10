require 'chitter'

describe Chitter do

  it 'returns a list of .all peeps' do
    connection = PG.connect(dbname: 'chitter')
    # Add the test data
    connection.exec("INSERT INTO chatter (peep) VALUES ('Rememeber to submit your ideas for our finmtec hakathon before 6pm today!');")
    connection.exec("INSERT INTO chatter (peep) VALUES ('Lost: Grey and White Pigeon with black bits. Normal size. A bit mangy looking. Does not hava a name.');")

    peeps = Chitter.all
    expect(peeps).to include('Rememeber to submit your ideas for our finmtec hakathon before 6pm today!')
    expect(peeps).to include('Lost: Grey and White Pigeon with black bits. Normal size. A bit mangy looking. Does not hava a name.')
  end

  it '.add creates a new peep' do
    new_peep = 'The Big Brother House is much smaller than it looks on TV.'
    Chitter.add(new_peep)
    expect(Chitter.all).to include new_peep
  end
end
