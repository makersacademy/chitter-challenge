describe Peep do
  before(:all) do
    create_example_user
    Peep.create(content: 'Test 1', user_id: 1)
  end

  it 'creates a new peep when #create is called' do
    expect(Peep.create(content: 'Test 2', user_id: 1)).to be_a Peep
  end

  it 'returns a list of peeps when #all is called' do
    expect(Peep.all).to be_an Array
  end

  it 'returns the content of the first peep when #all.first.content is called' do
    expect(Peep.all.first.content).to eq 'Test 1'
  end
end
