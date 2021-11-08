require 'peep'
require 'database_helpers'
require 'user'

describe Peep do
  let(:comment_class) { double(:comment_class) }
  let(:tag_class) { double(:tag_class) }

  describe '.all' do
    it 'returns all peeps' do
      
    connection = PG.connect(dbname: 'chitter_test')
    user = User.create(username: "kim", email: 'test@example.com', password: 'password123')
    peep = Peep.create(peep: "I use chitter daily", user_id: user.id)
    Peep.create(peep: "What did you say?")

    peeps = Peep.all 
    
    expect(peeps.length).to eq 2
    expect(peeps.first).to be_a Peep
    expect(peeps.first.id).to eq peep.id
    expect(peeps.first.peep).to eq "I use chitter daily"
    
    end
  end

  describe '.create' do
    it 'creates a new peep' do
      user = User.create(username: "kim", email: 'test@example.com', password: 'password123')
      peep = Peep.create(peep: 'Hi there!', user_id: user.id)
      persisted_data = persisted_data(id: peep.id, table: 'peeps')

      expect(peep).to be_a Peep
      expect(peep.id).to eq persisted_data.first['id']
      expect(peep.peep).to eq 'Hi there!'
    end
  end

  # describe '.delete' do
  # it 'deletes the given peep' do
  #   user = User.create(username: "kim", email: 'test@example.com', password: 'password123')
  #   peep = Peep.create(peep: 'Hi again')

  #   Peep.delete(id: peep.id)

  #   expect(Peep.all.length).to eq 0
  # end
# end

# describe '.update' do
#   it 'updates the peep with the given data' do
#     peep = Peep.create(peep: "Hi there again")
#     updated_peep = Peep.update(id: peep.id, peep: "Why though?")

#     expect(updated_peep).to be_a Peep
#     expect(updated_peep.id).to eq peep.id
#     expect(updated_peep.peep).to eq 'Why though?'
#   end
# end

describe '.find' do
    it 'returns the requested peep object' do
      peep = Peep.create(peep: 'How many times')

      result = Peep.find(id: peep.id)

      expect(result).to be_a Peep
      expect(result.id).to eq peep.id
      expect(result.peep).to eq 'How many times'
    end
  end

  describe '#comments' do
    it 'calls .where on the Comment class' do
      peep = Peep.create(peep: "Hiya")
      expect(comment_class).to receive(:where).with(peep_id: peep.id)

      peep.comments(comment_class)
    end
  end

  describe '#tags' do
    it 'calls .where on the Tag class' do
      user = User.create(username: "kim", email: 'test@example.com', password: 'password123')
      peep = Peep.create(peep: "Hi", user_id: user.id)
      expect(tag_class).to receive(:where).with(peep_id: peep.id)

      peep.tags(tag_class)
    end
  end

    describe '.where' do
    it 'returns peeps with the given tag id' do
      user = User.create(username: "kim", email: 'test@example.com', password: 'password123')
      peep = Peep.create(peep: "Hi John!", user_id: user.id)
      tag1 = Tag.create(content: 'test tag 1')
      tag2 = Tag.create(content: 'test tag 2')
      PeepTag.create(peep_id: peep.id, tag_id: tag1.id)
      PeepTag.create(peep_id: peep.id, tag_id: tag2.id)

      peeps = Peep.where(tag_id: tag1.id)
      result = peeps.first

      expect(peeps.length).to eq 1
      expect(result).to be_a Peep
      expect(result.id).to eq peep.id
      expect(result.peep).to eq peep.peep
    end
  end

end


