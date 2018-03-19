describe Peep do

  describe '#show_all' do
    it 'expect show all to return array of Peeps' do
      peeps = Peep.show_all
      expect(peeps).to be_a(Array)
      expect(peeps).to include(Peep)
    end
  end

  describe '#add' do
    it 'adds new peep to the database' do
      Peep.add(1, 'First peep addition rspec test')
      Peep.add(2, 'Second peep addition rspec test')
      # retrieving database entries to see if peeps above actually got added

      peeps = DatabaseConnection.query('SELECT * FROM peeps')
      peeps_array = peeps.map { |p| p['peep'] }
      expect(peeps_array).to include('First peep addition rspec test')
      expect(peeps_array).to include('Second peep addition rspec test')
    end
  end
end
