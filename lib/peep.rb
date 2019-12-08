class Peep

  attr_reader :id, :content, :created_at, :user_id

  def initialize(id:, content:, created_at:, user_id:)
    @id = id
    @content = content
    @created_at = created_at[0..15]
    @user_id = user_id
  end

  def self.all
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'chitter_test_database')
    else
      connection = PG.connect(dbname: 'chitter_database')
    end

    database = connection.exec("SELECT * FROM peeps;")

    database.map { |peep|
        Peep.new(id: peep['id'], content: peep['content'],
          created_at: peep['created_at'], user_id: peep['user_id'])
      }.reverse
  end

  def self.create(content:, user_id:)
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'chitter_test_database')
    else
      connection = PG.connect(dbname: 'chitter_database')
    end

    result = connection.exec("INSERT INTO peeps(content, created_at, user_id)
      VALUES('#{content}', NOW(), '#{user_id}') RETURNING id, content, created_at, user_id;")

    Peep.new(id: result[0]['id'], content: result[0]['content'],
      created_at: result[0]['created_at'], user_id: result[0]['user_id'])
  end
end
