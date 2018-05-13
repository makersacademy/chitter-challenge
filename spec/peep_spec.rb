require 'peep'

describe Peep do
  describe '#all' do
    it 'returns all peeps' do
      peeps = Peep.all
      messages = peeps.map(&:message)
      expect(messages).to include('Test peep 1')
      expect(messages).to include('Test peep 2')
      expect(messages).to include('Test peep 3')
    end
  end

  it 'shows all the times of peeps' do
    peeps = Peep.all
    times = peeps.map(&:time)
    expect(times).to include('2018-05-11 10:05:20')
    expect(times).to include('2018-05-11 20:24:00')
    expect(times).to include('2018-05-11 12:19:05')
  end

  describe '#create' do
    it 'creates a new peep' do
      Peep.create('Hello there!', '2018-05-12 12:15:10')
      peeps = Peep.all
      messages = peeps.map(&:message)
      times = peeps.map(&:time)
      expect(messages).to include('Hello there!')
      expect(times).to include('2018-05-12 12:15:10')
    end
  end
end
