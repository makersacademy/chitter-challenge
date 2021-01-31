require 'peep'
require 'database_helpers'

describe Peep do

  describe ".all" do
    it "shows a list of all peeps" do
      peep = Peep.create(peep_content: "I am peeping for the first time!")
      Peep.create(peep_content: "I am peeping for the first time, too!")
      Peep.create(peep_content: "Well, I am peeping for the second time!")

      peeps = Peep.all

      expect(peeps.length).to eq 3
      expect(peeps.first).to be_a Peep
      expect(peeps.first.id).to eq peeps.id
      expect(peeps.first.peep_content).to eq "I am peeping for the first time!"
    end
  end

  describe ".create" do
    it "creates a new peep" do
      peep = Peep.create(peep_content: "This is a test peep!")
      persisted_data = persisted_data(id: peep.id)

      expect(peep).to be_a Peep
      expect(peep.id).to eq persisted_data['id']
      expect(peep.peep_content)to include "This is a test peep!"
    end
  end



end