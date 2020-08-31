require_relative 'database_connection'

class Peep

   attr_reader :id, :peep, :time, :username

    def initialize(id:, peep:, time:, username:)
      @id = id
      @peep = peep
      @time = time
      @username = username
    end

     def self.add_peeps(message, time, username)
        peeps = DatabaseConnection.query("INSERT INTO peeps (peep, time, username) VALUES ('#{message}', '#{time}', '#{username}') RETURNING id, peep, username;")
        Peep.new(id: peeps[0]['id'], peep: peeps[0]['peep'], time: peeps[0]['time'], username: peeps[0]['username'])
     end

     def self.get_peeps
       peeps = DatabaseConnection.query("SELECT * FROM peeps;")
       all_peeps = peeps.map do |row|
          Peep.new(id: row['id'], peep: row['peep'], time: row['time'], username: row['username']) 
       end
       
        all_peeps.sort_by(&:time).reverse
      end

      
end