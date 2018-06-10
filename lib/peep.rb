require 'pg'

class Peep
    attr_reader :id, :content, :date
    def initialize(id, content, date)
        @content = content
        @id = id
        @date = date
    end

    def self.all
        if ENV['ENVIRONMENT'] == 'test'
            connection = PG.connect(dbname: 'chitter_test')
        else
            connection = PG.connect(dbname: 'chitter')
        end
        
        result = connection.exec("SELECT * FROM peeps")
        
        result.map{ |peep| Peep.new(peep['id'], peep['content'], peep['date']) }
    end

    def self.create(options)
        if ENV['ENVIRONMENT'] == 'test'
            connection = PG.connect(dbname: 'chitter_test')
        else
            connection = PG.connect(dbname: 'chitter')
        end
        
        result = connection.exec("INSERT INTO peeps (content, date) VALUES('#{options[:content]}', current_timestamp) RETURNING id, content, date")
        Peep.new(result.first['id'], result.first['content'], result.first['date'])
    end

    def ==(other)
        @id == other.id
    end
    
end