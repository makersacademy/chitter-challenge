require 'peep'
require 'database_helpers'

describe 'Peep' do
  describe '.all' do
    it "returns a list of peeps" do
      connection = PG.connect(dbname: 'chitter_board_test')

      # Add the test data:
      # peeps = Peep.create(title: 'UNTIL', author: 'Nelson Mandela', url: 'https://bit.ly/33ADu6u', message: "Hello world!")
      # peeps = Peep.create(title: 'Something very big',author: 'Donald J Trump', url: 'https://bit.ly/34MAALX', message: "Hello world!")
      # peeps = Peep.create(title: 'I am slow to learn', author: 'Abraham Lincoln', url: 'https://bit.ly/33AuU7P', message: "Hello world!")
      # peeps = Peep.create(title: 'The secret of life.', author: 'Fela Kuti', url: 'https://bit.ly/3717kmS', message: 'Hello world!')

      peeps = Peep.all

      expect(peeps).to include("UNTIL")
      expect(peeps).to include("Something very big")
      expect(peeps).to include("I am slow to learn")
      expect(peeps).to include("The secret of life.")
    end

    it "creates a new peep" do
      peep = Peep.create(title: 'Lorem ipsum dolor', author: 'Robert Minster', url: 'http://www.example.com', message: 'Do cross town buses run all night?')
      persisted_data = persisted_data(id: peep.id)

      expect(peep['title']).to eq 'Lorem ipsum dolor'
      expect(peep['author']).to eq 'Robert Minster'
      expect(peep['url']).to eq 'http://www.example.com'
      expect(peep['message']).to eq 'Do cross town buses run all night?'
    end

  end
end
