require 'pg'

class Peep
    attr_reader :id, :content
    def initialize(id, content)
        @content = content
        @id = id
    end

    def self.all
        if ENV['ENVIRONMENT'] == 'test'
            connection = PG.connect(dbname: 'peep_test')
        else
            connection = PG.connect(dbname: 'peep')
        end
        
        result = connection.exec("SELECT * FROM peeps")
        result.map{ |peep|  peep['content'] }
    end

    def self.create(options)
        if ENV['ENVIRONMENT'] == 'test'
            connection = PG.connect(dbname: 'peep_test')
        else
            connection = PG.connect(dbname: 'peep')
        end
        
        result = connection.exec("INSERT INTO peeps (content, date) VALUES('#{options[:content]}', current_timestamp)")
    end
end