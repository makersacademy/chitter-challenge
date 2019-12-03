require 'pg'

class Chitter
  attr_reader :peep, :posted_at

  def initialize(peep = '', posted_at = '')
    @peep = peep
    @posted_at = posted_at
  end

  def self.all

    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_db_test')
    else
      connection = PG.connect(dbname: 'chitter_db')
    end
    result = connection.exec("SELECT * FROM peeps ORDER BY id DESC;")
    result.map do |peep|
      Chitter.new(id: peep['id'], peep: peep['peep'], posted_at: peep['posted_at'] )
    end
  end
# result = connection.exec("SELECT * FROM bookmarks")
#   result.map do |bookmark|
#     Bookmark.new(id: bookmark['id'], title: bookmark['title'], url: bookmark['url'])
#   end
# end
  def self.create(peep:)

    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_db_test')
    else
      connection = PG.connect(dbname: 'chitter_db')
    end
      connection.exec("INSERT INTO peeps (peep, posted_at) VALUES('#{peep}','#{Time.now}')")
  end
end
