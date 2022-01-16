require 'pg'

class Peep
  def self.all
    ['Hello Chitter, this is my first message!',
     'Hello Chitter, this is my second post'
    ]
  end
 
  # def self.create(title:, peep:)
  #   if ENV['ENVIRONMENT'] == 'test'
  #     connection = PG.connect(dbname: 'bookmark_manager_test')
  #   else
  #     connection = PG.connect(dbname: 'bookmark_manager')
  #   end
  #   result = connection.exec_params("INSERT INTO bookmarks (url, title) VALUES($1, $2) RETURNING id, title, url;", [url, title])
  #   Bookmark.new(id: result[0]['id'], title: result[0]['title'], url: result[0]['url'])
  # end
end