require 'pg'

class Peep

  attr_reader :id, :username, :content, :created_at

  def initialize(id:, username:, content:, created_at:)
    @id = id
    @username = username
    @content = content
    @created_at = created_at
  end

  def self.create_new_peep(content:)
    connection = connect_to_db

    result = connection.exec("INSERT INTO peeps (content) VALUES('#{content}') RETURNING id, username, content, created_at;")
    Peep.new(id: result[0]['id'], username: result[0]['username'], content: result[0]['content'], created_at: result[0]['created_at'])
  end

  def self.view_all_peeps
    connection = connect_to_db

    result = connection.exec('SELECT * FROM peeps')
    result.map do |peep|
      Peep.new(id: peep["id"], username: peep["username"], content: peep["content"], created_at: peep["created_at"])
    end
  end

  def self.view_peeps_descending
    connection = connect_to_db

    result = connection.exec('SELECT * FROM peeps order by id DESC')
    result.map do |peep|
      Peep.new(id: peep["id"], username: peep["username"], content: peep["content"], created_at: peep["created_at"])
    end
  end

  def self.connect_to_db
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'peep_manager_test')
    else
      connection = PG.connect(dbname: 'peep_manager')
    end
  end

end
