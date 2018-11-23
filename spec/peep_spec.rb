require 'spec_helper'

describe Peep do

  describe '.create' do
    it 'creates a new peep' do
      peep = Peep.create(user_id: 1, content: 'Bleugh').first
      persisted_data = persisted_data(table: 'peeps', id: peep['id'])

      expect(peep['id']).to eq persisted_data['id']
      expect(peep['user_id']).to eq "1"
      expect(peep['content']).to eq 'Bleugh'
    end
  end
end
