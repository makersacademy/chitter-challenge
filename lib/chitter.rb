require 'pg'

class Chitter
  def self.timeline
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec('SELECT * FROM post ORDER BY date_posted DESC;')
    result.map { |post| post['peep'] }
  end

  def self.post(peep:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    p connection.exec("INSERT INTO post (peep, date_posted) VALUES ('#{peep}', '#{time = Time.new}')")
  end
end

