require 'peeps'
require 'database_helpers'

describe Peeps do

  it "should be able to post a list of peeps" do

    peeps = Peeps.create(content: 'Is this working?', time: Time.new)
    Peeps.create(content: 'I overshare on social media!', time: Time.new)
    Peeps.create(content: 'Does this have a different timestamp.', time: Time.new)

    peep = Peeps.all

     expect(peep.length).to eq(3)
     expect(peep.first).to be_a(Peeps)
     expect(peep.first.id).to eq peeps.id
     expect(peep.first.content).to eq('Is this working?')

  end

  it 'creates a new bookmark' do
    peep = Peeps.create(content: 'testing .create', time: Time.new)
    persisted_data = persisted_data(id: peep.id)

    expect(peep).to be_a Peeps
    expect(peep.id).to eq persisted_data['id']
    expect(peep.content).to eq('testing .create')
  end
end
