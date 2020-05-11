require 'chitter'

describe Chitter do

  it 'returns a list of .all peeps' do
    connection = PG.connect(dbname: 'chitter_test')
    # Add the test data
    connection.exec("INSERT INTO chatter (peep) VALUES ('Rememeber to submit your ideas for our fintec hackathon before 6pm today!');")
    connection.exec("INSERT INTO chatter (peep) VALUES ('Lost: Grey and White Pigeon with black bits. Normal size. A bit mangy looking. Does not hava a name.');")
    peeps = Chitter.all
    expect(peeps.length).to eq 2
    expect(peeps.first).to be_a Chitter
    expect(peeps.first.peep).to eq('Rememeber to submit your ideas for our fintec hackathon before 6pm today!')
  end

  it '.add creates a new peep' do
    new_peep = 'The Big Brother House is much smaller than it looks on TV.'
    peep = Chitter.add(new_peep)
    expect(peep.peep).to eq new_peep
  end

  it '.add timestamps each peep' do
    allow(Chitter).to receive(:time).and_return('1999-05-10 13:44:21 +0100')
    Chitter.add('today its all about time travel')
    connection = PG.connect(dbname: 'chitter_test')
    peeps = connection.exec('SELECT * FROM chatter')
    result = peeps.map { |latest| latest['timestamp'] }
    expect(result).to include('1999-05-10 13:44:21 +0100')
  end

end
