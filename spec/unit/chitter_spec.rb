describe Chitter do
  it 'responds to .all by returning all chitter messages' do
    expect(Chitter.all).to eq ["this is the first message ever posted to chitter", "this is the second", "okay now i've posted three"]
  end

  it 'responds to .add by adding a peep to the array of all peeps' do
    Chitter.add("this is a new peep")
    expect(Chitter.all).to eq ["this is the first message ever posted to chitter", "this is the second", "okay now i've posted three", "this is a new peep"]
  end
end