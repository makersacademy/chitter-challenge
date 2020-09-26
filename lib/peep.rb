require_relative 'database_connection'

class Peep

    def initialize(id, content, time)
        @id =id
        @content = content
        @time = time

    end

    # def self.show
    # result = DatabaseConnection.query("SELECT * FROM peep;")
    # result.map {|peep| Peep.new(peep['id'], peep['content'], peep['time'])}
    
    # end

    def self.add(content, time)
        result = DatabaseConnection.query("INSERT INTO peep(content, time) VALUES('#{content}'', '#{time}') RETURNING id, content, time")
        Bookmark.new(result[0]['id'], result[0]['content'], result[0]['time'])
    end
end