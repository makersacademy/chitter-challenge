require "pg"

class Status

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec('SELECT * FROM statuses')
    result.map { |status| [status['author'], status['status'], status['time']] }
  end

  def self.create(status:, author:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    time = "#{Time.now.hour}:#{Time.now.min}"
    connection.exec("INSERT INTO statuses (status, author, time)\
    VALUES('#{status}', '#{author}', '#{time}')")
  end

end
