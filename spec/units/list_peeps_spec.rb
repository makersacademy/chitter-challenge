require 'chitter'
describe Chitter do
  describe '.view' do
    it 'returns a list of peeps' do
      connection = PG.connect(dbname: 'chitter_test')
      connection.exec("INSERT INTO peeps (message) VALUES ('this is my first unit test example');")
      connection.exec("INSERT INTO peeps (message) VALUES ('another example peep for peep test db');")
      chitter = Chitter.view
      expect(chitter).to include('this is my first unit test example')
      expect(chitter).to include('another example peep for peep test db')
    end
  end
end
