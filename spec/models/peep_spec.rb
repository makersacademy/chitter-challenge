describe Peep do

  subject(:link){described_class.new(message: 'Hello World!')}

  it "Creates a peep" do
    expect(link.message).to eq('Hello World!')
  end

end
