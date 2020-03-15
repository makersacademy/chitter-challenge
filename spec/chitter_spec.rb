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
      Chitter.post_peep(peep: 'I am the first peep', post_time: '12:00:00', post_date: '2020-03-14')
      Chitter.post_peep(peep: 'I am the second peep', post_time: '12:00', post_date: '2020-03-14')

      chitter = Chitter.print_peeps

      # How to test they are displayed in order?

      expect(chitter.length).to eq 2
      expect(chitter.first).to be_a Peep
      expect(chitter.first.peep).to eq 'I am the first peep'
      expect(chitter.first.post_time).to eq '12:00:00'
      expect(chitter.first.post_date).to eq '2020-03-14'
    end
  end

  context '#post_peep' do
    it 'can post a new peep' do
      Chitter.post_peep(peep: 'I am a new peep', post_time: '12:00', post_date: '2020-03-14')

      peep = Chitter.post_peep(peep: 'I am a new peep', post_time: '12:00', post_date: '2020-03-14')
      # expect(peep).to be_a Peep
      expect(peep.peep).to eq 'I am a new peep'
    end
  end
end
