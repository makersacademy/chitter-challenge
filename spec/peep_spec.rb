require 'peep'

describe Peep do
  it { should have_property :content }
  it { should have_property :created_at }

  describe '#self.add' do
    it 'adds a new peep' do
      peep = Peep.add('test peep')
      expect(Peep.all).to include peep
    end
  end

  describe '#self.reverse_chron_order_peeps' do
    it 'reverses the order of peeps chronologically' do
      peeps = Peep.reverse_chron_order_peeps
      peep1_time = peeps[0].created_at
      peep2_time = peeps[1].created_at
      peep3_time = peeps[2].created_at
      expect(peep1_time).to be > peep2_time
      expect(peep2_time).to be > peep3_time
    end
  end
end
