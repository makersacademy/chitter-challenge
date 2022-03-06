require './docs/chitter'


describe Chitter do

  describe '#peep_history' do
    it 'returns no peeps when none are posted on Chitter' do
      expect(subject.peep_history).to be_empty
    end

    it 'lists all of the peeps in reverse chronological order' do
      subject.post_peep("Peep 1")
      subject.post_peep("Peep 2")
      subject.post_peep("Peep 3")
      expect(subject.peep_history.last).to include("Peep 1")
      expect(subject.peep_history.first).to include("Peep 3")
    end
  end

end
