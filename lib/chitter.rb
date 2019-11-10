require 'pg'
require "dotenv/load"

class Chitter

    attr_reader :id, :peep 
    
def initialize(id:, peep:)
    @id = id
    @peep = peep
end 

    def self.all
        connection = PG.connect(dbname: ENV['DB_NAME'])
        peeps = connection.exec('SELECT * FROM peeps')
        peeps.map {|peeping|        
        Chitter.new(id: peeping['id'], peep: peeping['peep']) }
    end 

    def self.create(url:, title:)
        connection = PG.connect(dbname: ENV['DB_NAME'])
        result = connection.exec("INSERT INTO peeps (peep) VALUES('#{peep}') RETURNING ID, peep;")
        Chitter.new(id: result[0]['id'], peep: result[0]['peep'])
        end 
    end