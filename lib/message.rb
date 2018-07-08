require 'pg'

class Message
  attr_reader :id, :message

  def initialize(id, message)
    @id  = id
    @message = message
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec("SELECT * FROM messages")

    # The result object contains the Bookmark, each of which is a hash of the bookmark ID,  bookmark URL and bookmark title. We map each hash to the url key of the hash. This gives us an array of the bookmark URLs and titles.

    # we return the correct data, wrapped in a Bookmark instance. e.g
    #  => [#<Bookmark:0x00007f8d6f023d30 @id="78", @url="http://www.google.com", @title="Google">, #<Bookmark:0x00007f8d6f023678 @id="79", @url="http://www.bbc.co.uk", @title="BBC">, #<Bookmark:0x00007f8d6e0606f0 @id="80", @url="http://www.yahoo.com", @title="Yahoo">]

    result.map { |message| Message.new(message['id'], message['message']) }
  end

  def self.create(params)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    # We are RETURNING the ID and URL from the bookmark we just inserted into the database and then wrapping it to a Bookmark instance e.g
    # => #<Bookmark:0x00007fe866135500 @id="95", @url="http://www.bbc.co.uk", @title="bbc">
    result = connection.exec("INSERT INTO messages (message) VALUES('#{params[:message]}') RETURNING id, message")
    Message.new(result.first['id'], result.first['message'])

  #   return false unless is_url?(params[:url])
  # result = connection.exec("INSERT INTO bookmarks (url, title) VALUES('#{params[:url]}', '#{params[:title]}') RETURNING id, url, title")
  # Bookmark.new(result.first['id'], result.first['url'], result.first['title'])
  end

  def ==(other)
    @id == other.id
  end
end
