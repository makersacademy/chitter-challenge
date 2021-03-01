require 'pg'

class Chitter_Page
  attr_reader :id, :comment, :day_time

  def initialize(id:, comment:, day_time:)
    @id  = id
    @comment = comment
    @day_time = day_time
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'Chitter_test')
    else
      connection = PG.connect(dbname: 'Chitter')
    end
    result = connection.exec("SELECT * FROM chitter_feed
      ORDER BY id DESC;")
    result.map do |feed|
      Chitter_Page.new(id: feed['id'], comment: feed['comment'], day_time: feed['day_time'])
    end
  end

  def self.create(comment:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'Chitter_test')
    else
      connection = PG.connect(dbname: 'Chitter')
    end
    feed = connection.exec("INSERT INTO chitter_feed (comment) VALUES('#{comment}') RETURNING id, comment, day_time;")
    Chitter_Page.new(id: feed[0]['id'], comment: feed[0]['comment'], day_time: feed[0]['day_time'])
  end

end
