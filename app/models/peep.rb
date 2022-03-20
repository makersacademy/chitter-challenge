require 'pg'

class Peep
  attr_reader :id, :content, :date

  def initialize(id:, content:, date:)
    @id = id
    @content = content
    @date = date
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_app_test')
    else
      connection = PG.connect(dbname: 'chitter_app')
    end

    posts = connection.exec("SELECT * FROM chitter;")
    posts.map { |post| Peep.new(id: post['id'], content: post['content'], date: post['date_post'])}
  end

  def self.create(content:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_app_test')
    else
      connection = PG.connect(dbname: 'chitter_app')
    end

    result = connection.exec_params(
      "INSERT INTO chitter (content) VALUES($1) RETURNING id, content, date_post", [content]
    )
    Peep.new(
      id: result.first['id'], 
      content: result.first['content'], 
      date: result.first['date_post']
    )
  end 
end