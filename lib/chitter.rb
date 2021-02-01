require 'pg'
require 'time'
require_relative 'user'

class Chitter 

    attr_reader :id, :peep, :time, :userid

    def initialize(id:, peep:, time:, userid:)
        @id = id 
        @peep = peep
        @time = time 
        @userid = userid
    end

    def self.post_peep(peep:, userid:)
        if ENV['ENVIRONMENT'] == 'test'
            connection = PG.connect(dbname: 'chitter_test')
        else 
            connection = PG.connect(dbname: 'chitter')
        end
        time = Time.new.strftime("%d/%m/%Y %k:%M")
        result = connection.exec("INSERT INTO chitters (peep, time, userid) VALUES('#{peep}', '#{time}', '#{userid}') RETURNING id, peep, time, userid;")
        Chitter.new(id: result[0]['id'], peep: result[0]['peep'], time: result[0]['time'], userid: result[0]['userid'])
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
                time: chitter['time'],
                userid: chitter['userid']
            )
        end
    end

end
