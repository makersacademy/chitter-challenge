require 'pg'

class Peep
  def self.all
    # connection = PG.connect(dbname: 'chitter_' + ENV['RACK_ENV'])
    result = DatabaseConnection.query("SELECT * FROM peeps")
    result.map do |peep|
      { text: peep['text'], author: peep['author'] }
    end
  end

  def self.create(peep)
    peep[:text].gsub!("'","''")
    peep[:author].gsub!("'","''")
    # connection = PG.connect(dbname: 'chitter_' + ENV['RACK_ENV'])
    DatabaseConnection.query("INSERT INTO peeps (text, author) VALUES
                                  ('#{peep[:text]}', '#{peep[:author]}')")
  end
end
