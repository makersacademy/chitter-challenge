require 'pg'

class Posts

  attr_reader :id, :name, :message

  def initialize(id:, name:, message:)
    @id = id
    @name = name
    @message = message
  end

  def self.show
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec("SELECT * FROM posts;")
    result.map { |post| Posts.new(id: post['id'], name: post['name'], message: post['message']) }
  end

  def self.create(name:, message:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec("INSERT INTO posts (name, message) VALUES ('#{name}','#{message}') RETURNING id,name,message;")
  end

end
