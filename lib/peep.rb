require 'pg'

class Peep
  def self.all
    connection = PG.connect(dbname: 'chitter_test') if ENV['RACK_ENV'] == 'test'
    connection = PG.connect(dbname: 'chitter') if ENV['RACK_ENV'] != 'test'
    
    result = connection.exec("SELECT * FROM peeps")
    array_of_peeps = result.map { |peep| { content: peep['content'], posted: peep['posted'] } }
    array_of_peeps.reverse
  end

  def self.create(content:)
    connection = PG.connect(dbname: 'chitter_test') if ENV['RACK_ENV'] == 'test'
    connection = PG.connect(dbname: 'chitter') if ENV['RACK_ENV'] != 'test'

    posted = Time.now.strftime("%I:%M %p, %d/%m/%Y")
    connection.exec("INSERT INTO peeps (content, posted) VALUES('#{content}', '#{posted}');")
  end
end
