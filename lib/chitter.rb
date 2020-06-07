# frozen_string_literal: true

require 'pg'

class Chitter
  def self.all
    connection = PG.connect(dbname: 'chitter_test')
    result = connection.exec('SELECT * FROM posts')

    result.map { |row| row['content'] }
  end


  def self.create(content)
   connection = PG.connect(dbname: 'chitter_test')
   result = connection.exec("INSERT INTO posts (content) VALUES ('#{content}') ")

  end
end
