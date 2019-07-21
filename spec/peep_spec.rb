require 'peep'

describe Peep do
  describe '#all' do
    it 'returns all peeps' do
      peep = Peep.create(peep: 'Test peep', time: '2019-07-16', peep_user: 'test_user')
      Peep.create(peep: 'Second test peep', time: '2019-07-17', peep_user: 'test_user_2')
      Peep.create(peep: 'Third test peep', time: '2019-07-18', peep_user: 'test_user')

      peeps = Peep.all

      expect(peeps.length).to eq 3
      expect(peeps.first).to be_a Peep
      expect(peeps.first.id).to eq peep.id
      expect(peeps.first.peep).to eq "Test peep"
      expect(peeps.first.time).to eq '2019-07-16 00:00:00'
      expect(peeps.first.peep_user).to eq 'test_user'
    end
  end
end
