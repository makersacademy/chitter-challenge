require 'peeps'
describe Peeps do
  describe "#add" do
    it "adds a peep to the list" do 
      peep = Peeps.add(peep: 'Just chilling...')

      expect(peep.peep).to eq ('Just chilling...')
    end
  end

  describe "#list" do
    it "shows all peeps in reverse cronological order" do
      Peeps.add(peep: 'Just chilling...')
      Peeps.add(peep: 'Coding...')
      Peeps.add(peep: 'Need a hot chocolate...')

      all_peeps = Peeps.list

      expect(all_peeps.length).to eq 3
      expect(all_peeps.first).to eq('Need a hot chocolate...')
    end
  end
end
