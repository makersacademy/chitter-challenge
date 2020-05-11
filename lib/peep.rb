require 'pg'

class Peep
  attr_reader :author, :content, :created_at

  def initialize(author:, content:, created_at:)
    @author = author
    @content = content
    @created_at = created_at
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec("SELECT * FROM peeps ORDER BY created_at DESC;")
    result.map do |peep|
      Peep.new(author: peep['author'], content: peep['content'], created_at: peep['created_at'][0..4])
    end
  end

  def self.create(author:, content:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec("INSERT INTO peeps (author, content, created_at) VALUES ('#{author}', '#{content}', NOW()) RETURNING author, content, created_at;")
    Peep.new(author: result[0]['author'], content: result[0]['content'], created_at: result[0]['created_at'])
  end
end
