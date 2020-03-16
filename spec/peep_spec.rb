require 'peep'

describe Peep do


  context '.create' do
    it 'user can create new peeps' do
      peep = Peep.create(peep: "Its my birthday, we gon party like its my birthday")
      expect(peep.peep).to eq "Its my birthday, we gon party like its my birthday"
    end

    
  end



end
