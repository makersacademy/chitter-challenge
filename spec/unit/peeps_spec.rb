require './lib/peeps'

describe Peeps do
  describe '.all' do
    it 'returns all peeps' do
      peeps = Peeps.all

      expect(peeps).to include('The sun is out! I wish this govt were too!')
      expect(peeps).to include('Saw this pub sign... Come in our beer is as cold as Pritti Patels heart! LOL')
      expect(peeps).to include('Support Ukraine - join the anti-war March on Saturday')
    end
  end
end
