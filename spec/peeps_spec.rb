require 'peeps'

describe Peeps do

  # it 'peeps to be able to store a peep' do
  #   peeps = Peeps.new
  #   peeps.add('1st peep')
  #   peeps.add('2nd peep')

  #   expect(peeps.messages).to include '1st peep'
  #   expect(peeps.messages).to include '2nd peep'
  # end

  it 'stores in the database a new peep' do
    Peeps.add("why hello there")

    expect(Peeps.all).to include "why hello there"
  end
  
end
