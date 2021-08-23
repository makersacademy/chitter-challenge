require 'pg'

class Peep
  attr_reader :message, :time
  def initialize(time:, message:)
    @message = message
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      conn = PG.connect(dbname: 'chitter_db_test')
    else
      conn = PG.connect(dbname: 'chitter_db')
    end
    result = conn.exec('SELECT * FROM peeps_db')
    result.map do |post|
      Peep.new(id: post['id'], time: post['time'], message: post['message'])
    end
  end

  def self.create(time:, message:)
    if ENV['ENVIRONMENT'] == 'test'
      conn = PG.connect(dbname: 'chitter_db_test')
    else
      conn = PG.connect(dbname: 'chitter_db')
    end

    result = conn.exec("INSERT INTO peeps_db (time, message) VALUES('#{time}', '#{message}') RETURNING id, url, title;")
    # Bookmarks.new(id: result[0]['id'], title: result[0]['title'], url: result[0]['url'])
  end

end
