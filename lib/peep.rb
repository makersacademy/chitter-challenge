require 'pg'

class Peep
  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    
    result = connection.exec('SELECT * FROM peeps;')
    result.map do |peep| 
      Peep.new(id: peep['id'], content: peep['content'], creation_time: peep['creation_time'], user_name: peep['user_name'])
    end
  end

  def self.create(content:, user_name:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec("INSERT INTO peeps (content, user_name) VALUES('#{content}', '#{user_name}') RETURNING id, content, creation_time, user_name;")
    Peep.new(id: result[0]['id'], content: result[0]['content'], creation_time: result[0]['creation_time'], user_name: result[0]['user_name'])
  end

  attr_reader :id, :content, :creation_time, :user_name

  def initialize(id:, content:, creation_time:, user_name:)
    @id = id
    @content = content
    @creation_time = creation_time
    @user_name = user_name
  end
end