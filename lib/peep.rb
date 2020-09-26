require_relative 'database_connection'

class Peep

    attr_reader :id, :content, :date_time

    def initialize(id, content, date_time)
        @id =id
        @content = content
        @date_time = date_time

    end

    def self.show
    result = DatabaseConnection.query("SELECT id, content, to_char(datetime, 'DD Mon YYYY HH24:MI:SS') AS \"datetime\" FROM peep;")
    result.map {|peep| Peep.new(peep['id'], peep['content'], peep['datetime'])}
    end

    def self.add(content)
        result = DatabaseConnection.query( "INSERT INTO peep(content, datetime) VALUES('#{content}', NOW()) RETURNING id, content, datetime")
        Peep.new(result[0]['id'], result[0]['content'], result[0]['datetime'])
    end
end