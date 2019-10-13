describe Peep do
  subject(:peep) { Peep.create(content: "Stuff") }
  it 'knows its content' do
    expect(peep.content).to eq "Stuff"
  end
  it 'knows its ID' do
    expect(peep.id).to be_a Integer
  end

  describe '#user' do
    let(:user_class) { double(:user_class) }
    it 'returns the user that posted the peep' do
      allow(peep).to receive(:user_class) { user_class }
      expect(user_class).to receive(:find_by).with(id: peep.user_id)
      peep.user
    end
  end
end