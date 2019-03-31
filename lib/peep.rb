require 'pg'

class Peep
  # giving us access to read the id, peep string and date. 
  attr_reader :id, :peep, :date

  # initializing the attributes we need on a peep.  
  def initialize(id:, peep:, date:)
    @id = id 
    @peep = peep
    @date = date
  end

  def self.all
    # if we are in test environment then connect to test bookmark manager. 
    if ENV['ENVIRONMENT'] == 'test'
      # the connection is created from connecting to the PG gem.
      connection = PG.connect(dbname: 'chitter_manager_test')
    # else connect to the real chitter manager
    else
      connection = PG.connect(dbname: 'chitter_manager')
    end
    # then execute/start connection and select everything - going to need a 
    # join table prob.
    result = connection.exec("SELECT * FROM peeps;")
    # map out every peep in that table by its date - will need to reverse it 
    # somehow in the view.
    result.map do |peep| peep['date'] 
    # creating a new peep object with the attributes it needs. 
    Peep.new(id: peep['id'], peep: peep['peep'], date: peep['date'])
    end
  end
end
