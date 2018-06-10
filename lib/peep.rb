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
        sql_query = "INSERT INTO chitter (peep)
                     VALUES('#{create[:peep]}')
                     RETURNING id, peep, time_stamp"

        result = database.exec(sql_query)
        Peep.new(result.first['id'], result.first['peep'], result.first['time_stamp'])
    end


    def self.read
        sql_query = "SELECT * FROM chitter ORDER BY time_stamp DESC"
        database.exec(sql_query).map { |peep|
            Peep.new(peep['id'], peep['peep'], peep['time_stamp']) }
    end


    def time
        t = Time.parse(timestamp)
        t.strftime(format='%B %d')
    end


    private

    def self.database
        ENV['ENVIRONMENT'] == 'test'  \
            ? PG.connect(dbname: 'chitter_challenge_test')  \
            : PG.connect(dbname: 'chitter_challenge')
    end

end