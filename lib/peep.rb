require 'pg'

class Peep

  attr_reader :id, :username, :content

  def initialize(id:, username:, content:)
    @id = id
    @username = username
    @content = content
  end

  def self.create_new_peep(content:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'peep_manager_test')
    else
      connection = PG.connect(dbname: 'peep_manager')
    end

    result = connection.exec("INSERT INTO peeps (content) VALUES('#{content}') RETURNING id, username, content;")
    Peep.new(id: result[0]['id'], username: result[0]['username'], content: result[0]['content'])
  end

  def self.view_all_peeps
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'peep_manager_test')
    else
      connection = PG.connect(dbname: 'peep_manager')
    end

    result = connection.exec('SELECT * FROM peeps')
    result.map do |peep|
      Peep.new(id: peep["id"], username: peep["username"], content: peep["content"])
    end
  end

end
