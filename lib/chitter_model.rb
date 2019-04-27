require 'pg'
require_relative '../spec/db_test_setup'

class ChitterModel
  def self.all
    results = DataBaseTestSetup.connection.exec('SELECT * FROM peep_table;')
    results.map do |peep_message|
      peep_message['peep']
    end
  end

  def self.create(a_peep)
    connection = DataBaseTestSetup.connection
    connection.exec("INSERT INTO peep_table (peep) VALUES('#{a_peep}') ")
  end
end
