describe Peep do

    it " Object Test: Can add retrieve #all from the database" do
      add_demo_peeps
      peeps = Peep.all
      p 'peep object test'
      p peeps
      expect(peeps.first.peep).to eq("This is my test peep")
      expect(peeps.first.username).to eq("James")
      expect(peeps[1].peep).to eq('This is another peep')
    end


  end
