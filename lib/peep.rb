require 'pg'

class Peep

  attr_reader :id, :post, :time

  def initialize(id:, post:, time:)
    @id = id
    @post = post
    @time = time
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec("SELECT * FROM peeps;")
    new_result = result.map { |peep| Peep.new(id: peep['id'], post: peep['post'], time: Time.parse(peep['time']).strftime("%Y/%m/%d %k:%M")) }
    new_result.reverse
  end

  def self.create(post:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec("INSERT INTO peeps (post) VALUES('#{post}') RETURNING id, post, time;")
    Peep.new(id: result[0]["id"], post: result[0]["post"], time: Time.parse(result[0]["time"]).strftime("%Y/%m/%d %k:%M"))
  end
end
