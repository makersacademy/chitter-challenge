require './lib/peep'

RSpec.describe Peep do 
  describe '#create' do
    peep = Peep.create( {user_id: 1, title: "test1", content: "testing" } )
    it 'A user can make a peep' do
      expect(peep.title).to eq "test1"
    end
end
end