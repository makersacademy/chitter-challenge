require 'pg'

class Chitter 

    def self.post_peep(message)
        if ENV['ENVIRONMENT'] == 'test'
            connection = PG.connect(dbname: 'chitter_test')
        else 
            connection = PG.connect(dbname: 'chitter')
        end
        
        connection.exec("INSERT INTO chitters (peep) VALUES('#{message}')")
    end 

    def self.timeline
        if ENV['ENVIRONMENT'] == 'test'
            connection = PG.connect(dbname: 'chitter_test')
        else 
            connection = PG.connect(dbname: 'chitter')
        end

        result = connection.exec("SELECT * FROM chitters")
        result.map { |chitter| chitter['peep'] }
        # self.timeline will output an array 
        # in views, do each loop to puts each peep out one by one. 
    end

end