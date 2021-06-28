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

describe '.all' do
  it 'returns a list of peeps' do
    connection = PG.connect(dbname: 'chitter_challenge_test')
 
    # Add the test data
    peep = Peep.create(peep: "Bonjour", author: "Test")
    Peep.create(peep: "Hola", author: "Test")
    Peep.create(peep: "Namaste", author: "Test")
 
    peeps = Peep.all
 
    expect(peeps.length).to eq 3
    expect(peeps.first).to be_a Peep
    expect(peeps.first.id).to eq peep.id
    expect(peeps.first.peep).to eq 'Bonjour'
    expect(peeps.first.author).to eq 'Test'
   end
 end