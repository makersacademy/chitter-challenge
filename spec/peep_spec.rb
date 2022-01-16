require 'peep'
require 'database_helpers'

describe '.create' do
  it 'allows the user to create a new peep' do

    peep = Peep.create(message: 'Test peep')
    persisted_data = persisted_data(id: peep.id)

    expect(peep.message).to eq('Test peep')
  end
end
