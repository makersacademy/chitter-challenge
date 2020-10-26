describe Chitter do
  it 'responds to .all by returning all chitter messages' do
    peep = Chitter.add('new peep')
    Chitter.add('newer peep')
    Chitter.add('newest peep')

    peeps = Chitter.all

    expect(peeps.length).to eq 3
    expect(peeps.first.message).to eq 'new peep'
    expect(peeps.first.id).to eq peep.id
    expect(peeps.first.time).to eq peep.time
  end

  it 'responds to .add by adding a peep to the array of all peeps' do
    chitter = Chitter.add('message')
    time = create_time = "#{Time.new}"
    persisted_data = persisted_data(id: chitter.id)

    expect(chitter).to be_a Chitter
    expect(chitter.id).to eq persisted_data['id']
    expect(chitter.time).to eq time
    expect(chitter.message).to eq 'message'
  end
end