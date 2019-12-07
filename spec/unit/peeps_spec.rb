require 'peeps'

describe Peeps do
  connection = PG.connect(dbname: 'chitter_test')

  describe '.all' do
    it 'should return a list of all peeps' do
      peep = Peeps.create(userid: 1, content: 'Test peep 1', time: '10:00')
      Peeps.create(userid: 2, content: 'Test peep 2', time: '11:00')
      Peeps.create(userid: 3, content: 'Test peep 3', time: '12:00')

      peeps = Peeps.all

      expect(peeps.length).to eq 3
      expect(peeps.first).to be_a Peeps
      expect(peeps.first.id).to eq peep.id
      expect(peeps.first.content).to eq 'Test peep 1'
      expect(peeps.first.time).to eq '10:00'
    end
  end

  describe '.create' do
    it "should create a new peep and add it to the database" do
      peep = Peeps.create(userid: 1, content: 'Test peep 1', time: '10:00')

      expect(peep).to be_a Peeps
      expect(peep.content).to eq 'Test peep 1'
      expect(peep.time).to eq '10:00'
    end
  end
end
