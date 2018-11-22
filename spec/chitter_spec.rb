require 'chitter'

describe '.post_peep' do
  it 'saves a peep in a messages table in the database' do
    peep = Chitter.post_peep(content: 'My new peep')
    # persisted_data = persisted_data(id: peep.id)

    expect(peep).to be_a Message
    # expect(peep.id).to eq persisted_data[:id]
    expect(peep.content).to eq 'My new peep'
    end
end
