require 'peep'

describe 'Peep' do
  describe '.all' do
    it "returns all the Peeps" do
      con = PG.connect(dbname: 'chitter_app_test')

      con.exec("INSERT INTO peeps (content) VALUES('My first Peep');")
      con.exec("INSERT INTO peeps (content) VALUES('My second Peep');")
      con.exec("INSERT INTO peeps (content) VALUES('My third Peep');")

      peeps = Peep.all

      expect(peeps).to include('My first Peep')
      expect(peeps).to include('My second Peep')
      expect(peeps).to include('My third Peep')
    end
  end
end