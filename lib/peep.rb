require 'pg'

class Peep

  def self.new(content)
    conn = PG.connect( dbname: 'chitter' )
    conn.exec( "INSERT INTO peeps (content) VALUES('#{content}');" )
  end

  def self.all
    conn = PG.connect( dbname: 'chitter' )
    results = conn.exec( "SELECT * FROM peeps;" )
    results.map { |result| result['content'] }
  end

end
