require 'peep'

describe Peep do
  describe ".create_new_peep" do
    it "creates a new peep" do
      sample_peep = 'This is a sample peep with my latest and greatest thought'
      peep = Peep.create_new_peep(content: sample_peep)

      expect(peep).to be_a Peep
      expect(peep).to respond_to(:id)
      expect(peep.content).to eq 'This is a sample peep with my latest and greatest thought'
    end
  end

  describe ".view_all_peeps" do
    it "shows all peeps" do
      # Set up some peeps in the database
      Peep.create_new_peep(content: "I''m a newbie, and this is my first peep!")
      Peep.create_new_peep(content: "My second peep, I think I like it!")
      Peep.create_new_peep(content: "I can''t stop peeping, I think I''m addicted!")
      # peep = the first peep created above
      peep_1 = Peep.view_all_peeps.first

      # check for peep_1
      expect(peep_1).to be_a Peep
      expect(peep_1).to respond_to(:id)
      expect(peep_1).to respond_to(:created_at)
      expect(peep_1.content).to eq "I'm a newbie, and this is my first peep!"

      # peep = the first peep created above
      peep_3 = Peep.view_all_peeps.last

      p peep_3

      # check for peep_1
      expect(peep_3.content).to eq "I can't stop peeping, I think I'm addicted!"
    end
  end

end
