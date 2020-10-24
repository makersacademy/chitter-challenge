describe Chitter do
  it 'responds to .all by returning all chitter messages' do
    expect(Chitter.all).to eq []
  end

  it 'responds to .add by adding a peep to the array of all peeps' do
    Chitter.add("this is a new peep")
    expect(Chitter.all).to eq ["this is a new peep"]
  end
end