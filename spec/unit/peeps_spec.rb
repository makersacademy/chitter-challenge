require 'peeps'

describe Peeps do
  let(:user) { double :user }
  connection = PG.connect(dbname: 'chitter_test')

  describe '.all' do
    it 'should return a list of all peeps' do
      connection.exec("INSERT INTO peeps(content) VALUES('This is my peep!')")

      expect(Peeps.all).to include 'This is my peep!'
    end
  end

  describe '.create' do
    it "should create a new peep and add it to the database" do
      Peeps.create(user, 'New peep', '10:00')
      expect(Peeps.all).to include 'New peep'
    end
  end
end
