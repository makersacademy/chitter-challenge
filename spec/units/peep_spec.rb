require 'peep'

describe Peep do
  let(:peep) { described_class.create('hello this is a practice peep') }
  describe '#self.all' do
    it 'returns all peeps' do
      peep
      expect(Peep.all.length).to eq 1
    end
  end

  describe "#self.add" do
    it "should add a peep to the database" do
      expect(peep).to be_a Peep
    end
  end

  describe '#comments' do
    it 'returns a list of comments on the bookmark' do
      peep_id = peep.id
      # peep below is peep_id within comments table
      DatabaseConnection.connection.exec_params(
        "INSERT INTO comments (id, comment, peep) VALUES(1, 'Test comment', $1)",
        [peep_id]
      )
      comment = peep.comments.first
      expect(comment['comment']).to eq 'Test comment'
    end

    # it 'calls .where on the on the Comment class' do
    #   peep = Peep.create(peep: 'this is a peep')
    #   expect(comment_class).to receive(:where).with(peep_id: peep.id)

    #   peep.comment(comment_class)
    # end
  end
end
