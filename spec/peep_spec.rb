require 'peep'
require 'database_helpers'

describe Peep do

  # before do
  #   user = User.create(email: 'test@example.com', password: 'password123')
  # end

  describe '.all' do
    it 'returns all peeps' do
      user = User.create(email: 'test@example.com', password: 'password123')
      Peep.create(text: 'the sky is blue', user_id: user.id)
      Peep.create(text: 'the sea is green', user_id: user.id)
      Peep.create(text: 'fire is red', user_id: user.id)
 
      peeps = Peep.all

      peep = peeps.first

      expect(peeps.length).to eq 3
      expect(peep).to be_a Peep
      expect(peep).to respond_to(:id)
      expect(peep.text).to eq('fire is red')
    end
  end

  describe '.create' do
    it 'adds a peep to the peep feed' do
      user = User.create(email: 'test@example.com', password: 'password123')
      peep = Peep.create(text: 'space is black', user_id: user.id)
      persisted_data = persisted_data(id: peep.id, table: 'peeps')

      expect(peep).to be_a Peep
      expect(peep).to respond_to(:id)
      expect(peep.id).to eq persisted_data.first['id']
      expect(peep.text).to eq('space is black')

    end

    it 'saves the times when the peep is created' do
      user = User.create(email: 'test@example.com', password: 'password123')
      peep = Peep.create(text: 'testing for time', user_id: user.id)
      formatted_time = Time.now.strftime("%I:%M%P on %m/%d/%Y")
      expect(peep.time).to eq formatted_time
    end

  end

  describe '.delete' do
    it 'deletes a peep from the chitter feed' do
      user = User.create(email: 'test@example.com', password: 'password123')
      peep = Peep.create(text: "pizza is red and yellow", user_id: user.id)
      Peep.delete(id: peep.id)
      expect(Peep.all.length).to eq(0)
    end
  end

  describe '.update' do
    it 'updates a peep in the chitter feed' do
      user = User.create(email: 'test@example.com', password: 'password123')
      peep = Peep.create(text: "Mug is white", user_id: user.id)
      updated_peep = Peep.update(id: peep.id, text: "Mug is NOT white")

      expect(updated_peep).to be_a Peep
      expect(updated_peep.id).to eq(peep.id)
      expect(updated_peep.text).to eq("Mug is NOT white")
    end
  end

  describe '.find' do
    it 'returns the requested peep' do
      user = User.create(email: 'test@example.com', password: 'password123')
      peep = Peep.create(text: "bees make honey", user_id: user.id)

      result = Peep.find(id: peep.id)

      expect(result).to be_a Peep
      expect(result.id).to eq(peep.id)
      expect(result.text).to eq("bees make honey")
    end

    
  end

  let(:comment_class) { double(:comment_class) }

  describe '#comments' do
    it 'returns a list of comments on the peep' do
      user = User.create(email: 'test@example.com', password: 'password123')
      peep = Peep.create(text: 'Testing123', user_id: user.id)

      DatabaseConnection.query("INSERT INTO comments (id, text, peep_id) VALUES(1, 'Test comment', #{peep.id})")
      comment = peep.comments.first

      expect(comment.text).to eq 'Test comment'
    end

    it 'calls .where on the Comment class' do
      user = User.create(email: 'test@example.com', password: 'password123')
      peep = Peep.create(text: 'Test Peep', user_id: user.id)
      expect(comment_class).to receive(:where).with(peep_id: peep.id)

      peep.comments(comment_class)
    end
  end
end
