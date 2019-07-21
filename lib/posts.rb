require 'pg'

class Posts

  def self.show_posts
    connection = PG.connect(dbname: 'chitter')
    result = connection.exec("SELECT * FROM peeps;")
    result.map { |post| post['peep_text'] }
  end
end
