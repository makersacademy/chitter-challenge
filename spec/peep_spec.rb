require 'peep'
require 'database_helpers'

describe Peep do
  describe '.all' do
    it 'returns all my peeps in reverse order' do
      connection = PG.connect(dbname: 'chitter_test')
      # Test data
      peep = Peep.create(post: 'Hello world, this is my first peep')
      Peep.create(post: 'I am going to let people know what I am doing')
      Peep.create(post: 'Every little thing')

      peeps = Peep.all

      expect(peeps.length).to eq 3
      expect(peeps.first).to be_a Peep
      expect(peeps.last.id).to eq peep.id
      expect(peeps.last.post).to eq 'Hello world, this is my first peep'
    end
  end

  describe '.create' do
    it 'posts a new peep to Chitter' do
      peep = Peep.create(post: 'I had toast for breakfast')
      persisted_data = persisted_data(id: peep.id)
      expect(peep).to be_a Peep
      expect(peep.id).to eq persisted_data['id']
      expect(peep.post).to eq 'I had toast for breakfast'
    end
    it 'gives the time when a peep is created' do
      time_now = Time.now.strftime("%Y/%m/%d %k:%M")
      peep = Peep.create(post: 'Test peep')
      expect(peep.time).to eq time_now
    end
  end
end
