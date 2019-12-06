require 'peeps'

describe Peeps do
  describe '.all' do
    it 'should return a list of all peeps' do
      connection = PG.connect(dbname: 'chitter_test')
      connection.exec("INSERT INTO peeps(user, content) VALUES('EllieM', 'This is my peep!')")

      visit('/')

      expect(Peeps.all).to include 'EllieM: This is my peep!'
    end
  end
end
