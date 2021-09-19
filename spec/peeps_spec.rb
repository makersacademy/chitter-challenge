require 'peep'
require 'setup_test_database'
require 'database_helper'

describe Peep do
  describe '.all' do
    it 'lists all peeps in table' do
      oldest_post = Peep.add(post: 'this is a test message')
      newest_post = Peep.add(post: 'this is another test message')

      all_peeps = Peep.all

      expect(all_peeps.first).to be_a Peep
      expect(all_peeps.length).to eq 2
      expect(all_peeps.first.post).to eq 'this is another test message'
      expect(all_peeps.first.timestamp). to eq newest_post.timestamp
      expect(all_peeps.first.id).to eq newest_post.id   
    end
  end

  describe '.add' do
    it 'is able to create a new peep' do
      peep = Peep.add(post: 'This is a test peep to check the add functionality!')
      persisted_data = persisted_data(id: peep.id)

      expect(peep).to be_a Peep
      expect(peep.id).to eq persisted_data['id']
      expect(peep.timestamp).to eq persisted_data['timestamp'][0..15]
      expect(peep.post).to eq 'This is a test peep to check the add functionality!'
    end
  end
end
