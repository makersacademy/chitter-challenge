describe Peep do

  subject(:peep) {
    described_class.new(
      id: 1,
      message: 'This is a peep about a cat'
    )
  }

  it 'is not valid without a message' do
    peep.message = nil
    expect(peep).to_not be_valid
  end

  it 'is not valid without a user' do
    peep.user = nil
    expect(peep).to_not be_valid
  end

end
