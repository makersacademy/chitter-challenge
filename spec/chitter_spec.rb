require 'chitter'
require 'database_helper'
describe Chitt do
  describe '.create' do
    it 'Creates a chirp' do
      chirp = Chitt.create(chirp: 'peep')
      persisted_data = persisted_data(id: chirp.id, table: 'chirps')

  #    expect(chirp.id).to eq(persisted_data.first['id'])
      expect(chirp).to be_a(Chitt)
      expect(chirp.chirp).to eq('peep')
    end
  end

  describe '.all' do
    it 'displays all the chirps' do
      connection = PG.connect(dbname: 'chitter_test')
      chirp = Chitt.create(chirp: 'Test 1')
      Chitt.create(chirp: 'Test 2')
      Chitt.create(chirp: 'Test 3')
      p chirp
      chirps = Chitt.all
      expect(chirps.length).to eq(3)
      expect(chirps.first).to be_a(Chitt)
      expect(chirps.first.id).to eq(chirp.id)
      expect(chirps.first.chirp).to eq('Test 1')
    end
  end

  describe '.find' do
    it 'returns the requested chirp object' do
      chirp = Chitt.create(chirp: 'peep')

      result = Chitt.find(id: chirp.id)

      expect(result).to be_a(Chitt)
      expect(result.id).to eq(chirp.id)
    end
  end

  describe '#comments' do
  it 'returns a list of comments on the chirp' do
    chirp = Chitt.create(chirp: 'peep')
    DatabaseConnection.query("INSERT INTO comments (id, text, chirp_id) VALUES(1, 'Test comment', #{chirp.id})")

    comment = chirp.comments.first

    expect(comment.text).to eq('Test comment')
    end
  end

  let(:comment_class) { double(:comment_class) }

describe '#comments' do
  it 'calls .where on the Comment class' do
    chirp = Chitt.create(chirp: 'peep')
    expect(comment_class).to receive(:where).with(chirp_id: chirp.id)

    chirp.comments(comment_class)
  end
end

end
