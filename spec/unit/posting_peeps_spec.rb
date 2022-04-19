require './lib/peeps'

describe Peeps do
  describe '.all' do
    it 'returns all peeps' do
      connection = PG.connect(dbname: 'peeps_manager_test')

      connection.exec("INSERT INTO peeps (peeps) VALUES('The sun is out! I wish this govt were too!');")
      connection.exec("INSERT INTO peeps (peeps) VALUES('Saw this pub sign... Come in our beer is as cold as Pritti Patels heart! LOL');")
      connection.exec("INSERT INTO peeps (peeps) VALUES('Support Ukraine - join the anti-war March on Saturday');")
      
      peeps = Peeps.all

      expect(peeps).to include('The sun is out! I wish this govt were too!')
      expect(peeps).to include('Saw this pub sign... Come in our beer is as cold as Pritti Patels heart! LOL')
      expect(peeps).to include('Support Ukraine - join the anti-war March on Saturday')
    end
  end

  describe '.create' do
    it 'creates a new peep' do
      Peeps.create(peeps: 'The sun is out! I wish this govt were too!')

      expect(Peeps.all).to include('The sun is out! I wish this govt were too!')
    end
  end
end
