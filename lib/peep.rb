require_relative 'database_connection'

class Peep

   attr_reader :id, :peep, :time

    def initialize(id:, peep:, time:)
      @id = id
      @peep = peep
      @time = time
    
    end

     def self.add_peeps(message, time)
        peeps = DatabaseConnection.query("INSERT INTO peeps (peep, time) VALUES ('#{message}', '#{time}') RETURNING id, peep;")
        Peep.new(id: peeps[0]['id'], peep: peeps[0]['peep'], time: peeps[0]['time'])
     end

     def self.get_peeps
       peeps = DatabaseConnection.query("SELECT * FROM peeps;")
       all_peeps = peeps.map do |row|
          Peep.new(id: row['id'], peep: row['peep'], time: row['time']) 
       end
       
        all_peeps.sort_by(&:time).reverse
       end

       def self.user(id:)
         user = DatabaseConnection.query("SELECT username FROM users WHERE id = #{id}")
         p user
       end
end