require './lib/peep.rb'

describe 'peep feed' do
  it 'should return all posted peeps' do
    peep1 = { content: 'Trump sucks' }
    Peep.create(peep1)

    peep2 = { content: 'Right???!!!' }
    Peep.create(peep2)

    expect(Peep.all.count).to eq(2)
  end
end