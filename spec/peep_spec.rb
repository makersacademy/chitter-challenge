require 'peep'
require 'database_helpers'

describe '.all' do
  
end

describe '.create' do
  it 'creates a new peep' do
    peep = Peep.create(peep: 'Hello World', author: 'Test')
    persisted_data = persisted_data(id: peep.id)

    expect(peep).to be_a Peep
    expect(peep.id).to eq persisted_data['id']
    expect(peep.peep).to eq 'Hello World'
    expect(peep.author).to eq 'Test'
  end

end