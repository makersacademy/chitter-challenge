require 'peep'

describe Peep do
  describe "#all" do
    it "shows a list of all Peeps" do

      add_test_peeps
      peeps = Peep.all

      expect(peeps.length).to eq 3
      expect(peeps[0]).to include('Test peep 1')
      expect(peeps[1]).to include('Test peep 2')
      expect(peeps[2]).to include('Test peep 3')
    end
  end

  describe "#create" do
    it 'creates a new Peep' do
      Peep.create(content: 'This is a peep')
      expect(Peep.all.first).to include('This is a peep')      
    end
  end
end
