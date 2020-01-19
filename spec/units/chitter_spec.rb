require 'chitter'
require 'database_helpers'

describe Chitter_Peep do 
  describe '#post' do 
    it 'posts a peep with body' do 
      peep = Chitter_Peep.post_peep(body: "My first peep")
      # persisted_data = persisted_data(body: peep.body)

      expect(peep.body).to eq "My first peep"
    end 

    xit 'posts a peep with time.now' do 
      expect(Chitter_Peep.post_peep(body: "My first peep", name: "Ben", handle: "squareben")).to eq Chitter_Peep.new(peep: "My first peep", time: Time.now, name: "Ben", handle: "squareben")  
    end 
  end   

  describe '#view_all' do 
    it 'shows all peeps on home page' do 
      peep = Chitter_Peep.post_peep(body: "My first peep")
      Chitter_Peep.post_peep(body: "My second peep")
      Chitter_Peep.post_peep(body: "My third peep")
      peeps = Chitter_Peep.view_all
      expect(peeps.length).to eq 3
      expect(peeps.first).to be_a Chitter_Peep
      expect(peeps.first.body).to eq "My first peep" 

    end 
  end 
end 