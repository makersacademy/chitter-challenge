require './lib/peep'

feature Peep do

 let(:peep_1) { Peep.new(1, 'Byte me!') }
 let(:peep_2) { Peep.new(1, 'Byte me!') }

  describe '.all' do
    it 'shows you peeps in reverse order' do
      visit('/peeps')
      peep_1 = Peep.add('Dont byte that')
      peep_2 = Peep.add('Hot on the keys')
      expect(Peep.all.last).to eq peep_1
    end
  end

  describe '.time' do
     it 'shows you what time a peep was created' do
       peep_1 = Peep.add('Hot on the ascKEYS')
       expect(Peep.all[0].time).to eq Time.now.asctime
     end
end
end
