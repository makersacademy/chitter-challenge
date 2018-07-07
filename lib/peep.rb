class Peep

  attr_reader :id, :content, :username

  def initialize(id, content, username)
    @id = id
    @content = content
    @username = username
  end

  def self.create(user_id, content)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: "chitter_test")
    else
      connection = PG.connect(dbname: "chitter")
    end
    result = connection.exec("INSERT INTO peeps (user_id, content) VALUES('#{user_id}','#{content}')")
    #Peep.new(result.first['id'], result.first['content'], result.first['user_id'])
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: "chitter_test")
    else
      connection = PG.connect(dbname: "chitter")
    end
    result = connection.exec("SELECT peeps.id, peeps.content, users.username FROM peeps INNER JOIN users ON peeps.user_id = users.id")
    result.map { |peep| Peep.new(peep['id'], peep['content'], peep['username']) }
  end

end
