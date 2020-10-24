require './lib/peeps'
require 'database_helper'

describe Peeps do
  describe '#.all' do
    
    it 'returns a list of peeps' do
      connection = PG.connect(dbname: 'chitter_test')

      Peeps.add(body: 'Happy Friday!')
      Peeps.add(body: 'Does chitter remind you of anything? Tweet Tweet')
      newest_peep = Peeps.add(body: 'testing newest tweet')

      p peeps = Peeps.all
      
      expect(peeps.length).to eq 3
      expect(peeps.first).to be_a Peeps
      expect(peeps.first.id).to eq newest_peep.id
      expect(peeps.first.body).to eq 'testing newest tweet'
      expect(peeps.first.post_time).to eq newest_peep.post_time
    end
  end

  describe '#.add' do
    it 'adds a new peep to the peep feed' do
      new_peep = Peeps.add(body: 'new peep')
      persisted_data = persisted_data(id: new_peep.id)

      expect(new_peep).to be_a Peeps
      expect(new_peep.id).to eq persisted_data['id']
      expect(new_peep.body).to eq 'new peep'
    end
  end
end
