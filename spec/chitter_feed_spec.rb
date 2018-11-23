require 'spec_helper'

describe ChitterFeed do

  describe '.all' do
    it 'returns a list of peeps' do
      peeps = ChitterFeed.all
      persisted_data = persisted_data(table: 'peeps', id: peeps.first.id)

      expect(peeps.length).to eq 3
      expect(peeps.first).to be_a Peep
      expect(peeps.first.id).to eq persisted_data['id']
      expect(peeps.first.username).to eq 'danusia.x'
      expect(peeps.first.content).to eq 'Hello Chitter!'
    end

    it 'returns a list of peeps in chronological order' do
      peep = Peep.create(user_id: 1, content: 'Bleugh').first
      peeps = ChitterFeed.all

      ordered_peeps = peeps.each { |p| p.timestamp }

      expect(peeps[0].id).to eq peep['id']
      expect(peeps[1].id).to eq ordered_peeps[1].id
      expect(peeps[2].id).to eq ordered_peeps[2].id
      expect(peeps[3].id).to eq ordered_peeps[3].id
    end
  end
end
