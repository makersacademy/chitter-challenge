require 'peeps'

describe Peeps do
  let(:user) { double :user }
  connection = PG.connect(dbname: 'chitter_test')

  describe '.all' do
    it 'should return a list of all peeps' do
      connection.exec("INSERT INTO peeps(content) VALUES('Test peep')")

      expect(Peeps.all).to include 'Test peep'
    end
  end

  describe '.create' do
    it "should create a new peep and add it to the database" do
      Peeps.create(user, 'Test peep', '10:00')
      expect(Peeps.all).to include 'Test peep'
    end
  end
end
