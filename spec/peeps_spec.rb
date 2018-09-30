require 'peeps'
require 'users'

describe Peeps do
  describe '#all' do
    it 'returns an array of peeps' do
      peep = Peeps.all.first
      expect(peep.id).to eq "3"
      expect(peep.content).to eq "Trump was inagurated 2 years ago. Sad."
      expect(peep.time).to eq "2018-01-13 11:23:00+00"
      expect(peep.email).to eq "test@email.com"
    end
    it 'returns the peeps in reverse chronological order' do
      peeps = Peeps.all
      expect(peeps[0].time).to eq "2018-01-13 11:23:00+00"
      expect(peeps[2].time).to eq "2017-12-25 10:00:00+00"
    end
  end
  describe '#create' do
    it 'creates new peep in database' do
      Peeps.create('A new peep in the database. #MAGA','donald@whitehouse.gov')
      peep = Peeps.all.first
      expect(peep.content).to eq 'A new peep in the database. #MAGA'
    end
  end

end
