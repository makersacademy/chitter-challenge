describe '.all' do
  it 'returns a list of all peeps' do
    connection.exec("INSERT INTO peeps (peep) VALUES ('Today is Wednesday ');")
    peeps = Peeps.all

    expect(peeps).to include "Today is Wednesday "
  end
end
