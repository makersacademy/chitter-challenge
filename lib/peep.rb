require 'pg'

class Peep
  attr_reader :id, :content, :user, :handle

  def initialize(id:, content:, user:, handle:)
    @id = id
    @content = content
    @user = user
    @handle = handle
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec("SELECT * FROM peeps;")
    result.map do |peep| 
      Peep.new(id: peep['id'], content: peep['content'], user: peep['username'], handle: peep['userhandle']) 
    end 
  end

  def self.add(content: , user: , handle: )

    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec_params("INSERT INTO peeps (content, username, userhandle) VALUES($1, $2, $3) RETURNING id, content, username, userhandle;", [content, user, handle])
    result[0]['id']
    Peep.new(id: result[0]['id'], content: result[0]['content'], user: result[0]['username'], handle: result[0]['userhandle'])
  end
end