require 'pg'

class Peeps

  attr_reader :peeps :created_on

  def initialize(peeps:, created_on:)
    @peeps = peeps
    @created_on = created_on
  end 

  def self.all
    ENV['ENVIRONMENT'] == 'test'
    connection = PG.connect(dbname: 'chitter')
    result = connection.exec("SELECT * FROM peeps")
    result.map do |peeps|
      Peeps.new(peeps: peeps['peeps'], created_on: peeps['created_on'])
    end
  end

#   def self.create(peeps:, created_on:)
#     if ENV['ENVIRONMENT'] == 'test'
#       connection = PG.connect(dbname: 'bookmark_manager_test')
#     else
#       connection = PG.connect(dbname: 'bookmark_manager')
#     end
#     result = connection.exec("INSERT INTO bookmarks (url, title) VALUES('#{url}', '#{title}') RETURNING id, title, url;")
#     Bookmark.new(id: result[0]['id'], title: result[0]['title'], url: result[0]['url'])
#   end
end