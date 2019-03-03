require "pg"
class Post

  def initialize(id, text)
    @id = id
    @text = text
  end
  
  def self.create(text)
    if ENV['ENVIRONMENT']=="test"
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec("INSERT INTO Post (text) VALUES ('#{text}');")
  end



end
