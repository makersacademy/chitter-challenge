require 'peeps'

describe Peeps do
  connection = PG.connect(dbname: 'chitter_test')

  describe '.all' do
    it 'should return a list of all peeps' do
      connection.exec("INSERT INTO peeps(userid, content) VALUES('EllieM', 'Test peep')")
      expect(Peeps.all).to include 'EllieM: Test peep'
    end
  end

  describe '.create' do
    it "should create a new peep and add it to the database" do
      Peeps.create('EllieM', 'Test peep', Time.now)
      expect(Peeps.all).to include 'EllieM: Test peep'  
    end
  end
end
