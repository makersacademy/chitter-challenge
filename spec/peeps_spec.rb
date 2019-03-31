require 'peep'


# UNIT TEST for peep... 
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

      # was stuck here for age trying to get the peep element from the array. 
      expect(peeps.first.peep).to include "Whooooop"
    end
  end
end