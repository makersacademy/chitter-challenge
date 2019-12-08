require "pg"

class Status

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec('SELECT * FROM statuses')
    result.map { |status| [status['author'], status["status"]] }
  end

  def self.create(status:, author:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    connection.exec("INSERT INTO statuses (status, author) VALUES('#{status}', '#{author}')")
  end

end
