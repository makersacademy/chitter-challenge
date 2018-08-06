require 'peep'
require 'time'

describe Peep do
  before(:each) do
    stub_time = '11:34:02'
    stub_date = '11/11/11'
    allow(Time).to receive(:now).and_return(stub_time)
    allow(DateTime).to receive(:now).and_return(stub_date)
  end

  describe '.all' do
    it 'returns all peeps' do
      Peep.create('Is this real life?', 'marek')
      expect(Peep.all).to include '["Is this real life? by @marek at 11:34:02 on 2011-11-11"]'
    end
  end

  describe '.create' do
    it 'creates a new peep' do
      Peep.create('Is this just fantasy?', 'marek')
      expect(Peep.all).to include '["Is this just fantasy? by @marek at 11:34:02 on 2011-11-11"]'
    end
  end
end
