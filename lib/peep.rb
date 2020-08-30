require_relative 'database_connection'

class Peep

   attr_reader :id, :peep

    def initialize(id:, peep:)
      @id = id
      @peep = peep
    end

     def self.add_peeps(message)
        peeps = DatabaseConnection.query("INSERT INTO peeps (peep) VALUES ('#{message}') RETURNING id, peep;")
        Peep.new(id: peeps[0]['id'], peep: peeps[0]['peep'])
     end

     def self.get_peeps
       peeps = DatabaseConnection.query("SELECT * FROM peeps;")
       peeps.map do |row|
          Peep.new(id: row['id'], peep: row['peep']) 
       end
   
     end
end