require 'peep'
require 'database_helpers'

describe '.all' do
  it 'returns a list of peeps' do
    connection = PG.connect(dbname: 'chitter_test')
    
    peep = Peep.create(content: "Hello, working on my Chitter weekend-challenge", user_name: 'Tomas')
    Peep.create(content: "Getting, started with my Chitter, and my second post.", user_name: 'Elena')
    
    peeps = Peep.all
    
    expect(peeps.length).to eq 2
    expect(peeps.first).to be_a Peep
    expect(peeps.first.id).to eq peep.id
    expect(peeps.first.content).to eq 'Hello, working on my Chitter weekend-challenge'
    expect(peeps.first.user_name).to eq 'Tomas'
  end


end

describe './create' do
  it 'creates a new peep post'do
    peep = Peep.create(content: 'This is my Third post', user_name: 'Tomas')
    persisted_data = persisted_data(id: peep.id)

    expect(peep).to be_a Peep
    expect(peep.id).to eq persisted_data['id']
    expect(peep.content).to eq 'This is my Third post'
    expect(peep.user_name).to eq 'Tomas'
  end
end