require 'peep'

# FEATURE TEST for peeps... 
describe Peep do
  describe '.all' do
    it 'returns all peeps' do
      # connect to the test database as this is a test... 
      connection = PG.connect(dbname: 'chitter_manager_test')

      #in the test connection add peep and date details with three set of values. 
      connection.exec("INSERT INTO peeps (peep, date) VALUES
          ('Whooooop', TO_DATE('10/03/2019', 'DD/MM/YYYY')),
          ('This is another peep!!', TO_DATE('11/03/2019', 'DD/MM/YYYY')),
          ('This is yet another peep!!', TO_DATE('12/03/2019', 'DD/MM/YYYY'));
        ")

      # create an object of the Peep class, with method all called on it. 
      peeps = Peep.all
      p peeps.methods
      p peeps.class

      # there is an issue here with the testing, 
      expect(peeps.first.peep).to eq("Whooooop")
      expect(peeps.first.date).to eq('2019-03-10')
      expect(peeps.length).to eq(3)
    end
  end
end