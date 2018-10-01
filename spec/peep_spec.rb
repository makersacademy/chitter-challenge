require 'peep'

describe Peep do
  describe '.view_all' do
    it 'lists all peeps' do
    connection = PG.connect(dbname: 'chitter_test')

    connection.exec("INSERT INTO peeps (message) VALUES ('Grrr, aarf aarf!')")
      peeps = Peep.view_all[0]
      expect(peeps.message).to include('Grrr, aarf aarf!')
    end
  end
end
