require '.app/models/peep'

describe Peep do
  describe ".create" do
    it "Returns a peep instance" do
     Peep.create(message: 'Test peep')
     peep = Peep.all
     expect(peep.first.message).to eq 'Test peep'
    end
  end

end
