class Peep

  attr_reader :id, :content, :created_at

  def initialize(id:, content:, created_at:)
    @id = id
    @content = content
    @created_at = created_at[0..15]
  end

  def self.all
    # if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'chitter_test_database')
    # else
    #   connection = PG.connect(dbname: 'chitter_database')
    # end
    database = connection.exec("SELECT * FROM peeps;")
    database.map { |peep|
        Peep.new(id: peep['id'], content: peep['content'], created_at: peep['created_at'])
      }.reverse
  end

  def self.create(content)
    # if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'chitter_test_database')
    # else
    #   connection = PG.connect(dbname: 'chitter_database')
    # end
    result = connection.exec("INSERT INTO peeps(content, created_at)
      VALUES('#{content}', NOW()) RETURNING id, content, created_at;")
    Peep.new(id: result[0]['id'], content: result[0]['content'],
      created_at: result[0]['created_at'])
  end
end
