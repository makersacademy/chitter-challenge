require 'peeps'
describe Peeps do
  describe "#add" do
    it "adds a peep to the list" do 
      message = Peeps.add(peep: 'Just chilling...', time_of_peep: '12:11:30')

      expect(message.peep).to eq ('Just chilling...')
      expect(message.time_of_peep).to eq ('12:11:30')
    end
  end

  describe "#list" do
    it "shows all peeps" do
      Peeps.add(peep: 'Just chilling...', time_of_peep: "12:11:30")
      Peeps.add(peep: 'Coding...', time_of_peep: '15:11:30')
      Peeps.add(peep: 'Need a hot chocolate...', time_of_peep: '20:17:30')

      all_peeps = Peeps.list

      expect(all_peeps.length).to eq 3
      expect(all_peeps.first.peep).to eq('Just chilling...')
      expect(all_peeps.first.time_of_peep).to eq('12:11:30')
    end
  end
end
