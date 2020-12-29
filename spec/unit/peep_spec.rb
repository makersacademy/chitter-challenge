require 'chitter'

describe 'the Cheeter .all method' do
  it 'returns a list of peeps' do
    chitter = Chitter.create(peep: "its a good day")
    Chitter.create(peep: "Hello everyone  ")
    chitter_entries = Chitter.all
    expect(chitter_entries.length).to eq 2
    expect(chitter_entries.first).to be_a Chitter
    expect(chitter_entries.first.id).to eq chitter.id
    expect(chitter_entries.first.peep).to eq "its a good day"
  end
end

describe '.create' do
  it 'Can create a peep' do
    peep_entry=Chitter.create(peep: "I have my birthday")
    expect(peep_entry.peep).to eq "I have my birthday"
  end
end
