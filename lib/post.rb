class Post

  attr_reader :msg, :time, :id

  def initialize(msg:, time:, id:)
    @msg = msg
    @url = url
    @id = id
  end

  def self.create(msg:, time:, id:)


     result = DatabaseConnection.query("SELECT * FROM bookmarks WHERE id = #{id};")
     Bookmark.new(id: result[0]['id'], title: result[0]['title'], url: result[0]['url'])
  end

end
