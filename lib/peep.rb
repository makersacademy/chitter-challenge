require 'pg'

class Peep
  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_board_test')
    else
      connection = PG.connect(dbname: 'chitter_board')
    end
    peeps = connection.exec('SELECT * FROM peeps;')
    peeps.map { |peep|
      Peep.new(id: peeps['id'], title: peep['title'], author: peep['author'], url: peep['url'], message: peep['message'])
    }
  end

  def self.create(title:, author:, url:, message:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_board_test')
    else
      connection = PG.connect(dbname: 'chitter_board')
    end
    peeps = connection.exec("INSERT INTO peeps (title, author, url, message) VALUES('#{title}', '#{author}', '#{url}', '#{message}') RETURNING title, author, url, message;")
    Peep.new(id: peeps[0]['id'], title: peeps[0]['title'], author: peeps[0]['author'], url: peeps[0]['url'], message: peeps[0]['message'])
  end

  attr_reader :id, :title, :author, :url, :message

  def initialize(id:, title:, author:, url:, message:)
    @id = id
    @title = title
    @author = author
    @url = url
    @message = message
  end
end
