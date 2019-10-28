require 'pg'
class Peep
    def self.all
      if ENV['ENVIRONMENT'] == 'test'
        connection = PG.connect(dbname: 'Chitter_test')
      else
        connection = PG.connect(dbname: 'Chitter')
      end
      result = connection.exec("SELECT * FROM peep;")
      result.map { |peep| peep['content'] }.reverse
    end

    def self.add(content:)
      if ENV['ENVIRONMENT'] == 'test'
        connection = PG.connect(dbname: 'Chitter_test')
      else
        connection = PG.connect(dbname: 'Chitter')
      end
      time = Time.new

      connection.exec("INSERT INTO peep (content, time) VALUES('#{content}', '#{time.hour}:#{time.min}')")
    end
end
