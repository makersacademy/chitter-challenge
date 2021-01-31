require 'pg'
require 'time'

class Chitter 

    attr_reader :id, :peep, :time 

    def initialize(id:, peep:, time:)
        @id = id 
        @peep = peep
        @time = time 
    end

    def self.post_peep(peep:)
        if ENV['ENVIRONMENT'] == 'test'
            connection = PG.connect(dbname: 'chitter_test')
        else 
            connection = PG.connect(dbname: 'chitter')
        end
        time = Time.new.strftime("%d/%m/%Y %k:%M")
        result = connection.exec("INSERT INTO chitters (peep, time) VALUES('#{peep}', '#{time}') RETURNING id, peep, time;")
        Chitter.new(id: result[0]['id'], peep: result[0]['peep'], time: result[0]['time'])
    end 

    def self.timeline
        if ENV['ENVIRONMENT'] == 'test'
            connection = PG.connect(dbname: 'chitter_test')
        else 
            connection = PG.connect(dbname: 'chitter')
        end

        chitter = connection.exec('SELECT * FROM chitters;')
        chitter.map do |chitter|
            Chitter.new(
                id: chitter['id'],
                peep: chitter['peep'],
                time: chitter['time']
            )
        end
    end

end
