require 'peep_class'
require 'pg'

describe Peep do
  describe '#post' do
    it 'post the message to the database' do
      status_post = Peep.post(message: "I am cleaning my house").first
      expect(status_post['message']).to eq "I am cleaning my house"
    end
  end

  describe '#.reverse' do
    it 'returns the peeps in reverse chronological order' do
      Peep.post(message: 'First peep')
      Peep.post(message: 'Second peep')
      peeps = Peep.sort_by
      expect(peeps.first.messages).to eq 'Second peep'
    end
  end
end
