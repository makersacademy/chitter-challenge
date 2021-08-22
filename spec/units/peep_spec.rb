require 'peep'

describe Peep do
  
  describe '#self.all' do
    it 'returns all peeps' do
      Peep.create('hello this is a practice peep')

      expect(Peep.all.length).to eq 1
    end


  end

  describe "#self.add" do
    it "should add a peep to the database" do
      peep = Peep.create('hello this is a practice peep')

      expect(peep).to be_a Peep
    end
  end

  describe '#comments' do
    it 'returns a list of comments on the bookmark' do
      new_peep = Peep.create('hello this is a practice peep')
      peep_id = new_peep.id
      if ENV['RACK_ENV'] = 'test'
        con = PG.connect :dbname => 'chitter_test'
      else
        con = PG.connect :dbname => 'chitter'
      end
      # peep below is peep_id within comments table
      con.exec(
        "INSERT INTO comments (id, comment, peep) VALUES(1, 'Test comment', $1)",
        [peep_id]
      )
      comment = new_peep.comments.first

      expect(comment['comment']).to eq 'Test comment'
    end
  end
end