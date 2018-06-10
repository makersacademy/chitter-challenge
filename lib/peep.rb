require 'pg'

class Peep
    
    attr_reader :id, :peep, :timestamp

    
    def initialize(id, peep, timestamp)
        @id = id
        @peep = peep
        @timestamp = timestamp
    end

    def ==(peep)
        @id == peep.id
    end


    def self.create(create)
        sql_query = "INSERT INTO chitter (peeps)
                     VALUES('#{create[:peep]}')
                     RETURNING id, peeps, time_stamp"

        result = database.exec(sql_query)
        Peep.new(result.first['id'], result.first['peeps'], result.first['time_stamp'])
    end


    def self.read
        sql_query = "SELECT * FROM chitter"

        database.exec(sql_query).map { |peeps|
            Peep.new(peeps['id'], peeps['peeps'], peeps['time_stamp']) }
    end



    private

    def self.database
        ENV['ENVIRONMENT'] == 'test'  \
            ? PG.connect(dbname: 'chitter_challenge_test')  \
            : PG.connect(dbname: 'chitter_challenge')
    end

end