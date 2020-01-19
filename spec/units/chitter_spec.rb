require 'chitter'
require 'database_helpers'

describe Chitter_Peep do 
  describe '#post' do 
    it 'posts a peep with body' do 
      peep = Chitter_Peep.post_peep(body: "My first peep", name: "Ben", handle: "squareben")
      # persisted_data = persisted_data(body: peep.body)

      expect(peep.body).to eq "My first peep"
    end 

    it 'posts a peep with time.now' do 
      peep = Chitter_Peep.post_peep(body: "My first peep", name: "Ben", handle: "squareben")  
      expect(peep.time).to eq Time.now.round.to_s
    end 

    it 'posts a peep with name & handle' do 
      peep = Chitter_Peep.post_peep(body: "My first peep", name: "Ben", handle: "squareben")  
      expect(peep.time).to eq Time.now.round.to_s
      expect(peep.name).to eq "Ben"
      expect(peep.handle).to eq "squareben"
    end 
  end   

  describe '#view_all' do 
    it 'shows all peeps on home page' do 
      peep = Chitter_Peep.post_peep(body: "My first peep", name: "Ben", handle: "squareben")
      Chitter_Peep.post_peep(body: "My second peep", name: "Sam", handle: "sam123")
      Chitter_Peep.post_peep(body: "My third peep", name: "Bob", handle: "bob123")
      peeps = Chitter_Peep.view_all
      expect(peeps.length).to eq 3
      expect(peeps.first).to be_a Chitter_Peep
      expect(peeps.first.body).to eq "My first peep" 
    end 
  end 
end 