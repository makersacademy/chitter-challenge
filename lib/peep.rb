require_relative 'database_connection'

class Peep

    attr_reader :id, :content, :datetime

    def initialize(id, content, datetime)
        @id =id
        @content = content
        @datetime = datetime

    end

    # def self.show
    # result = DatabaseConnection.query("SELECT id, content, to_char(datetime, 'DD Mon YYYY HH24:MI:SS') FROM peep;")
    # result.map {|peep| Peep.new(peep['id'], peep['content'], peep['datetime'])}
    
    # end

    def self.add(content)
        result = DatabaseConnection.query( "INSERT INTO peep(content, datetime) VALUES('#{content}', NOW()) RETURNING id, content, datetime")
        Peep.new(result[0]['id'], result[0]['content'], result[0]['datetime'])
    end
end