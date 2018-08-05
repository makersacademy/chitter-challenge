require 'pg'
class Peep
  def self.all
    connection = if ENV['ENVIRONMENT'] == 'test'
                   PG.connect(dbname: 'chitter_test')
                 else
                   PG.connect(dbname: 'chitter')
                 end
    result = connection.exec('SELECT * FROM peeps')
      result.map{ |peep| peep['peep'] }
    
  end

  def self.create(options)
    connection = if ENV['ENVIRONMENT'] == 'test'
                   PG.connect(dbname: 'chitter_test')
                 else
                   PG.connect(dbname: 'chitter')
    end
    connection.exec("INSERT INTO bookmarks (url) VALUES ('#{options[:url]}')")
  end
end