require 'pg'
require_relative '../spec/db_test_setup'

class ChitterModel
  def self.all
    results = DataBaseTestSetup.connection.exec('SELECT peep,created_at::time(0) FROM peep_table;')
    results.map do |peep_message|
      peep_message
    end
  end

  def self.create(peep:)
    connection = DataBaseTestSetup.connection
    result = connection.exec("INSERT INTO peep_table (peep) VALUES('#{peep}') RETURNING id, peep;")
    ChitterModel.new(id: result[0]['id'], peep: result[0]['peep'])
  end

  attr_reader :id, :peep

  def initialize(id:, peep:)
    @id = id 
    @peep = peep
  end

end
