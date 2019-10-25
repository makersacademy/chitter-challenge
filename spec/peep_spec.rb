require 'peep'
require 'database_helpers'
require 'tag'
require 'peep_tag'
require 'pg'

describe Peep do
  let(:tag_class) { double(:tag_class) }
  let(:time) { "12:12:12" }

  describe '.all' do
    it 'returns a list of bookmarks' do
      Peep.create(time_stamp: time, message: "I am bored right now")
      Peep.create(time_stamp: time, message: "I am bored")
      peep = Peep.create(time_stamp: time, message: "Binge watch time")

      peeps = Peep.all

      expect(peeps.length).to eq 3
      expect(peeps.first).to be_a Peep
      expect(peeps.first.id).to eq peep.id
      expect(peeps.first.message).to eq "Binge watch time"
      expect(peeps.first.time_stamp).to eq(time)
    end
  end

  describe '.create' do
    it 'creates a new bookmark' do
      peep = Peep.create(time_stamp: time, message: "I am bored right now")
      persisted_data = persisted_data(id: peep.id, table: 'peeps')

      expect(peep).to be_a Peep
      expect(peep.id).to eq persisted_data.first['id']
      expect(peep.message).to eq "I am bored right now"
      expect(peep.time_stamp).to eq(time)
    end
  end

  describe '#tags' do
    it 'calls .where on the Tag class' do
      peep = Peep.create(time_stamp: time, message: "I am bored right now")
      expect(tag_class).to receive(:where).with(peep_id: peep.id)

      peep.tags(tag_class)
    end
  end
end
