require './models/peep'

describe Peep do
  it 'can have a body' do
    peep = Peep.new
    peep.add("It's friday!")
    expect(peep.body).to eq("It's friday!")
  end

  it 'can add peep to the database' do
    
  end
end