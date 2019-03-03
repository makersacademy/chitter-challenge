require './lib/peep'
# require 'database_helpers'

describe 'Adding a peep on chitter' do
  it 'updates the databse with the peep' do
    # Add the test data
    Peep.add(peep_text: 'This is my first peep')

    # Get the data back from the database
    p peeps = Peep.all

    # Test it
    expect(peeps.length).to eq 1
    expect(peeps.first.peep_text).to eq 'This is my first peep'
  end
end
