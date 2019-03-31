require './app/lib/peep'
require 'timecop'

describe Peep do

  it '#create a peep' do
    peep = Peep.create(peep: 'This is a peep')

    expect(peep).to be_a Peep
    expect(peep.peep).to eq('This is a peep')
  end


  it '#shows all the peeps' do
    peep = Peep.create(peep: 'This is a peep')
    Peep.create(peep: 'This is the second peep')
    Peep.create(peep: 'This is the third peep')

    peeps = Peep.all
    
    expect(peeps.length).to eq 3
    expect(peeps.first).to be_a Peep
    expect(peeps.first.id).to_not eq peep.id
    expect(peeps.first.peep).to eq 'This is the third peep'

  end


  it '#reverse chrono order for peeps' do
    Peep.create(peep: 'I washed my car')
    Peep.create(peep: 'I polished my car')
    Peep.create(peep: 'I hoovered my car')

    expect(Peep.all.first.peep).to eq('I hoovered my car')
  end

  it 'peep has a timestamp' do
    Timecop.freeze
    Peep.create(peep: 'I washed my car')

    expect(Peep.all.first.time.to_s).to eq(Time.now.to_s)
  end

end
