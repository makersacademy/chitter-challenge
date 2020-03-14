require 'chitter'

describe Chitter do
  context '#print_peeps' do
    it 'can print a list with all peeps' do
      # connection = PG.connect(dbname: 'chitter_test')
      #
      # # Add the test data
      # connection.exec("INSERT INTO peeps (peep) VALUES ('I am the first peep');")
      # connection.exec("INSERT INTO peeps (peep) VALUES('And I am the second one');")

      # Refactor:
      Chitter.post_peep(peep: 'I am the first peep')
      Chitter.post_peep(peep: 'I am the second peep')

      chitter = Chitter.print_peeps

      # How to test they are displayed in order?

      expect(chitter).to include ('I am the first peep')
      expect(chitter).to include ('I am the second peep')
    end
  end

  context '#post_peep' do
    it 'can post a new peep' do
      Chitter.post_peep(peep: 'I am a new peep')

      peep = Chitter.post_peep(peep: 'I am a new peep')
      # expect(peep).to be_a Peep
      expect(peep.peep).to eq 'I am a new peep'
    end
  end
end
