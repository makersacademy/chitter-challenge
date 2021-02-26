require 'pg'
require 'database_helper'

describe Peep do

  describe '.add' do
    it 'adds peep to the feed'do

    message = Peep.add(content: 'Peep' )
    persisted_data = persisted_data(id: message.id)

    expect(message).to be_a Peep
    expect(message.id).to eq persisted_data['id']
    expect(message.content).to eq 'Peep'

    end
  end

  describe '.all' do
    it'returns all the peeps' do
      Peep.add( content: 'Peep' )
      Peep.add( content: 'Peep_two' )

      feed = Peep.all
      expect(feed.length).to eq 2
      expect(feed.first).to be_a Peep

    end
  end
end
