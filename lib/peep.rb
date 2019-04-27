require 'pg'

class Peep
  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect dbname: 'chitter_test'
    else
      connection = PG.connect dbname: 'chitter'
    end
    result = connection.exec 'SELECT * FROM peeps ORDER BY id DESC'
    result.map do |row| "
      #{row['message']} - posted at
      #{Time.parse(row['posted_at']).strftime("%I:%M %p")}
      "
    end
  end

  def self.create(message:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect dbname: 'chitter_test'
    else
      connection = PG.connect dbname: 'chitter'
    end
    connection.exec "
    INSERT INTO peeps (message, posted_at)
    VALUES ('#{message}', '#{Time.now}')
    "
  end
end
