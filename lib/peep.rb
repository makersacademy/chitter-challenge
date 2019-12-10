require 'pg'

class Peep

  attr_reader :id, :content, :created_at

  def initialize(id:, content:, created_at:, user_id:, user_class: User)
    @id = id
    @content = content
    @created_at = created_at[0..15]
    @user_id = user_id
    @user_class = user_class
  end

  def user
    if ENV['RACK_ENV'] == 'test'
      @connection = PG.connect(dbname: 'chitter_test_database')
    else
      @connection = PG.connect(dbname: 'chitter_database')
    end

    result = @connection.exec("SELECT * FROM users WHERE user_id = '#{@user_id}';")

    @user_class.new_user(result)
  end

  def self.all
    self.connect_to_database

    database = @connection.exec("SELECT * FROM peeps;")

    database.map { |peep|
        Peep.new(id: peep['id'], content: peep['content'],
          created_at: peep['created_at'], user_id: peep['user_id'])
      }.reverse
  end

  def self.create(content:, user_id:)
    self.connect_to_database

    result = @connection.exec("INSERT INTO peeps(content, created_at, user_id)
      VALUES('#{content}', NOW(), '#{user_id}') RETURNING id, content, created_at, user_id;")

    Peep.new(id: result[0]['id'], content: result[0]['content'],
      created_at: result[0]['created_at'], user_id: result[0]['user_id'])
  end

  # private

  def self.connect_to_database
    if ENV['RACK_ENV'] == 'test'
      @connection = PG.connect(dbname: 'chitter_test_database')
    else
      @connection = PG.connect(dbname: 'chitter_database')
    end
  end
end
