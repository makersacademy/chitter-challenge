require 'peep'

describe 'Peep' do
  
  describe '.see_all' do
    it 'displays all peeps' do
      connection = PG.connect(dbname: 'peep_manager_test')
      connection.exec("INSERT INTO peeps (user_name, user_handle, peep) VALUES ('Harry', '@thechosenone', 'Harry Potter thats me')")
      connection.exec("INSERT INTO peeps (user_name, user_handle, peep) VALUES ('Ron', '@notthechosenone', 'Ron, Ron, Ron Weasley')")

      peeps = Peep.see_all

      expect(peeps.first.user_name).to include "Harry"



    end
  end
end
