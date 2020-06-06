require 'chitter'
require 'date'
require 'timecop'

describe Chitter do

  it 'should return a date' do
    Timecop.freeze(Date.parse('01 Januray 2019'))
    peep = Chitter.new('body', '12-05-00.00', '2020-01-01', 'username')
    expect(peep.time).to eq('01 Jan 20')
  end

  it '.all should return all return an array of the peeps' do
    expect(Chitter.all[0].body).to eq('chitter 1')
  end

  it 'sets the current user to nil on .logout' do

  end

end
