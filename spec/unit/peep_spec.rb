require 'peep'

# describe '.all' do
#   it 'returns a list of peeps' do
#     # Add the test data
#     DatabaseConnection.query("INSERT INTO peeps (message) VALUES('Peep 1');")
#     DatabaseConnection.query("INSERT INTO peeps (message) VALUES('Peep 2');")
#     DatabaseConnection.query("INSERT INTO peeps (message) VALUES('Peep 3');")
#
#     peeps = Peep.all
#
#     expect(peeps).to include 'Peep 1'
#     expect(peeps).to include 'Peep 2'
#     expect(peeps).to include 'Peep 3'
#   end
# end

describe '.all' do
  it 'returns a list of peeps' do

    peep = DatabaseConnection.query("INSERT INTO peeps (message) VALUES('Peep 1');")
    DatabaseConnection.query("INSERT INTO peeps (message) VALUES('Peep 2');")
    DatabaseConnection.query("INSERT INTO peeps (message) VALUES('Peep 3');")

    peeps = Peep.all

    expect(peeps.length).to eq 3
    expect(peeps.first).to be_a Peep
    expect(peeps.first.message).to eq 'Peep 1'
  end
end
