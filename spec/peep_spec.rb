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

  describe '#replies' do
    context 'when no replies' do
      it 'returns nil' do
        expect(peep.replies).to be nil
      end
    end

    it 'returns a list of peeps' do
      Peep.create(content: 'stuff', parent_id: peep.id)
      expect(peep.replies.first.content).to eq 'stuff'
    end
  end

  describe '.parents' do
    it 'returns all parent peeps' do
      Peep.create(content: 'things', parent_id: peep.id)
      
      expect(Peep.parents.first).to be_a(Peep)
    end
  end
end