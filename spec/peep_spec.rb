require 'peep'

describe 'Peep' do
  describe '.all' do
    it "returns a list of peeps" do
      connection = PG.connect(dbname: 'chitter_board_test')

      # Add the test data:
      connection.exec("INSERT INTO peeps (title, author, url) VALUES('UNTIL','Nelson Mandela','https://bit.ly/33ADu6u');")
      connection.exec("INSERT INTO peeps (title, author, url) VALUES('Something very big','Donald J Trump','https://bit.ly/34MAALX');")
      connection.exec("INSERT INTO peeps (title, author, url) VALUES('I am slow to learn','Abraham Lincoln','https://bit.ly/33AuU7P');")
      connection.exec("INSERT INTO peeps (title, author, url) VALUES('The secret of life.','Fela Kuti','https://bit.ly/3717kmS');")

      peeps = Peep.all

      expect(peeps).to include("UNTIL")
      expect(peeps).to include("Something very big")
      expect(peeps).to include("I am slow to learn")
      expect(peeps).to include("The secret of life.")
    end

    it "creates a new peep" do
      Peep.create(title: 'Lorem ipsum dolor')

      expect(Peep.all).to include 'Lorem ipsum dolor'
    end

  end
end
