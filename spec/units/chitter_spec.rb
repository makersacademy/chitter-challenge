require 'chitter'
require 'date'
require 'timecop'

describe Chitter do

  it 'should return a date' do
    Timecop.freeze(Date.parse('01 Januray 2019'))
    peep = Chitter.new('body', '2020-01-01 12-05-00', 'username')
    expect(peep.time).to eq('01 Jan 20')
  end

  it '.all should return all return an array of the peeps' do
    expect(Chitter.all[0].body).to eq('chitter 1')
  end

  it '.all should delete a peep' do
    Chitter.delete('1')
    all = Chitter.all
    bodies = all.map { |peep| peep.body }
    expect(bodies).not_to include('chitter 1')
  end

end
