require 'peep'
require 'Time'

describe 'Peep' do
  context '.all' do
    it 'returns all of the peeps in the database' do
      Peep.create(peep: "first", username: 'king_of_universe', timestamp: Time.local(-2280).getutc.to_s[0..-5])
      Peep.create(peep: "got to do the stupid festival today #CantBeAsked", username: 'sargons_bff', timestamp: Time.local(-550).getutc.to_s[0..-5])
      Peep.create(peep: "Guys i just found this totally sick temple come check it out", username: 'sargons_bff', timestamp: Time.local(-540).getutc.to_s[0..-5])
      Peep.create(peep: "@sargons_bff mine", username: 'cerces', timestamp: Time.local(-539).getutc.to_s[0..-5])
    end
  end
end