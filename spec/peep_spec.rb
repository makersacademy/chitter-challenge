require 'peep'
require 'web_helpers'

describe Peep do
  describe '#.create' do
    it 'creates a new peep' do
      peep = Peep.create('This is the peep content!', 'user')
      expect(peep).to be_a Peep
      expect(peep.content).to eq 'This is the peep content!'
    end
  end

  describe "#all" do
    it "returns all peeps in reverse chronological order" do
      clear_table()
      Peep.create('This is the peep content!', 'user')
      sleep(1)
      Peep.create('This is also peep content!', 'user')
      expect(Peep.all[0].content).to eq 'This is also peep content!'
      expect(Peep.all[1].content).to eq 'This is the peep content!'
    end
  end
end