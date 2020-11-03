require_relative 'database_connection'

class Peep

   attr_reader :id, :peep, :time, :username, :name

    def initialize(id:, peep:, time:, username:, name:)
      @id = id
      @peep = peep
      @time = time
      @username = username
      @name = name
    end

     def self.add_peeps(message, time, username, name)
        peeps = DatabaseConnection.query("INSERT INTO peeps (peep, time, username, name) VALUES ('#{message}', '#{time}', '#{username}', '#{name}') RETURNING id, peep, username, name;")
        Peep.new(id: peeps[0]['id'], peep: peeps[0]['peep'], time: peeps[0]['time'], username: peeps[0]['username'], name: peeps[0]['name'])
     end

     def self.get_peeps
       peeps = DatabaseConnection.query("SELECT * FROM peeps;")
       all_peeps = peeps.map do |row|
          Peep.new(id: row['id'], peep: row['peep'], time: row['time'], username: row['username'], name: row['name']) 
          end
       
        all_peeps.sort_by(&:time).reverse
      end

      
end