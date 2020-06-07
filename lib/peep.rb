require 'pg'

class Peep 
  attr_reader :id, :title, :peep 

  def initialize(id:, title:, peep:)
    @id = id
    @title = title
    @peep = peep
  end 

  def self.all
        # connection = PG.connect(dbname: 'chitter')
        # result = connection.exec("SELECT * FROM peep_manager;")
        # result.map { |peep| peep['peep'] }
        if ENV['ENVIRONMENT'] == 'test'
          connection = PG.connect(dbname: 'chitter_test')
        else
          connection = PG.connect(dbname: 'chitter')
        end
    
        result = connection.exec("SELECT * FROM peep_manager;")
        result.map { |bookmark| bookmark['peep'] }
      end
      # result = connection.exec("SELECT * FROM peep_manager")
      # result.map do |peep|
      #   Peep.new(id: peep['id'], title: peep['title'], peep: peep['peep'])
      # end
    # end
end

  