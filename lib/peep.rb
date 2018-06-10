require 'pg'
require 'database_connection'

class Peep
    attr_reader :id, :content, :date
    def initialize(id, content, date)
        @content = content
        @id = id
        @date = date
    end

    def self.all
        result = DatabaseConnection.query("SELECT * FROM peeps")
        result.map{ |peep| Peep.new(peep['id'], peep['content'], peep['date']) }
    end

    def self.create(options)
        result = DatabaseConnection.query("INSERT INTO peeps (content, date) VALUES('#{options[:content]}', current_timestamp) RETURNING id, content, date")
        Peep.new(result.first['id'], result.first['content'], result.first['date'])
    end

    def ==(other)
        @id == other.id
    end
    
end