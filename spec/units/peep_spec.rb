require_relative '../../app/models/peep'

describe Peep do
  subject(:peep) { described_class.new(id: "99", username: "leo", body: "Woof!", posted_on: "2020-10-10 12:12:12") }

  describe "#initialize" do
    it "has username, body and time" do
      expect(peep.id).to eq "99"
      expect(peep.username).to eq "leo"
      expect(peep.body).to eq "Woof!"
      expect(peep.posted_on).to eq "2020-10-10 12:12:12"
    end
  end

  describe "#find_by" do
    it 'returns a peep instance by id' do
      peeps = Peep.all
      peep = peeps.first 
      found_peep = Peep.find_by(id: peep.id)

      expect(found_peep.id).to eq peep.id
    end
  end

  describe '#all' do
    it "returns an array of peeps" do
      peeps = Peep.all

      expect(peeps).to be_a Array
    end
  end

  describe '#create' do 
    it "adds new peep" do
      Peep.create(username: 'kiriarf', body: 'yeet this tweet')
      peeps = Peep.all

      expect(peeps.last).to be_a Peep
    end
  end

  describe '#delete' do
    it "removes a record from the table" do
      Peep.create(username: "kiriarf", body: "test peep")
      peep_id = Peep.all.last.id
      Peep.delete(id: peep_id)
      peeps = Peep.all
      
      expect(peeps).not_to include(id: peep_id)
    end
  end

  describe '#update' do
    it "updates the body of a peep" do
      Peep.create(username: "kiriarf", body: "test peep")
      peep_id = Peep.all.last.id
      Peep.update(id: peep_id, body: "updated!")
      expect(Peep.all.last.body).to eq "updated!"
    end
  end

end
