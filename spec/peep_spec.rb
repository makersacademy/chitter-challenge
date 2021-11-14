describe '.all' do
  it 'returns a list of all peeps' do
    connection = PG.connect(dbname: 'chitter_test')

    # Add the test data
    connection.exec("INSERT INTO peeps (content) VALUES ('Hi there this a test');")
   
    peeps = Peep.all
    peeps = peeps[0].content

    expect(peeps).to include('Hi there this a test')
  end
end
  
require 'database_helpers'
  
describe '.create' do
  it 'creates a new peep' do
    peep = Peep.create(new_content: 'Test peep')
    persisted_data = persisted_data(id: peep.id)

    expect(peep).to be_a Peep
    expect(peep.id).to eq persisted_data['id']
    expect(peep.content).to eq 'Test peep'
  end
end
