require 'database_helpers'

describe 'Peep' do

 describe '.all' do
   it 'returns a list of peeps' do
     peep = Peep.post(name: "Chloe Verity", username: "chloeverity123", post: "lolololo", time: Time.now)
     Peep.post(name: "Janice Verity", username: "janverity", post: "hi", time: Time.now)
     peeps = Peep.all
     expect(peeps.length).to eq 2
     expect(peeps.first).to be_a Peep
     expect(peeps.first.post).to eq 'lolololo'
   end
 end

  describe '.post' do
    it 'posts a peep' do
      peep = Peep.post(name: "Chloe Verity", username: "chloeverity123", post: "lolololo", time: Time.now)
      expect(Peep.all.length).to eq 1
    end
  end

  describe '.delete' do
   it 'deletes a peep' do
     peep = Peep.post(name: "Chloe Verity", username: "chloeverity123", post: "lolololo", time: Time.now)
     Peep.delete(post: peep.post)
     expect(Peep.all.length).to eq 0
   end
 end

 describe '.edit' do
   it 'edits a peep' do
     peep = Peep.post(name: "Chloe Verity", username: "chloeverity123", post: "A peep tp edit!", time: Time.now)
     edited_peep = Peep.edit(post: 'An edited peep!')
     expect(edited_peep).to be_a Peep
   end
 end
end
