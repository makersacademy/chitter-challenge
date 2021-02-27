require 'pg'

class Chitter_Page
  attr_reader :id, :comment

  def initialize(id:, comment:)
    @id  = id
    @comment = comment
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'Chitter_test')
    else
      connection = PG.connect(dbname: 'Chitter')
    end
    result = connection.exec("SELECT * FROM chitter_feed")
    result.map do |feed|
      Chitter_Page.new(id: feed['id'], comment: feed['comment'])
    end
  end

  def self.create(comment:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'Chitter_test')
    else
      connection = PG.connect(dbname: 'Chitter')
    end
    result = connection.exec("INSERT INTO chitter_feed (comment) VALUES('#{comment}') RETURNING comment;")
    Chitter_Page.new(id: result[0]['id'], comment: result[0]['comment'])
  end

end
