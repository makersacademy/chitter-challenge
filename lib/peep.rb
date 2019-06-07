class Peep
  attr_reader :author, :title, :content

  def initialize(author, handle, content)
    @author = author
    @handle = handle
    @content = content
  end

  def self.all
    result = DatabaseConnection.query('SELECT * FROM peeps;')
    result.map{ |peep| Peep.new(post['author'], post['handle'], post['content']) }
  end
end
