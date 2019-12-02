# require 'pg'
class Chitter
  # def self.all
  #   if ENV['RACK_ENV'] == 'test'
  #     connection = PG.connect(dbname: 'bookmark_manager_test')
  #   else
  #     connection = PG.connect(dbname: 'bookmark_manager')
  #   end
  #   result = connection.exec('SELECT * FROM bookmarks')
  #   result.map { |bookmark| bookmark['url'] }
  # end

  # def self.create(url:)
  #   # if ENV['RACK_ENV'] == 'test'
  #   #   connection = PG.connect(dbname: 'bookmark_manager_test')
  #   # else
  #   #   connection = PG.connect(dbname: 'bookmark_manager')
  #   # end
  #   # connection.exec("INSERT INTO bookmarks (url) VALUES('#{url}')")
  # end
end
