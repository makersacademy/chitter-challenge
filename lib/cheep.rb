class Cheep

  attr_reader :post, :id

  def initialize(post:, id:)
    @post = post
    @id = id
  end

  def self.post(string)
    conn = PG.connect(dbname: 'chitter_test')
    result = conn.exec("INSERT INTO posts (post)
                        VALUES ('#{string}')
                        RETURNING id, post"
                      )
    Cheep.new(post: result[0]['post'], id: result[0]['id'])
  end

  def self.all
    conn = PG.connect(dbname: 'chitter_test')
    result = conn.exec('SELECT * FROM posts')
    result.map { |rec| Cheep.new(post: rec['post'], id: rec['id']) }.reverse
  end
end
