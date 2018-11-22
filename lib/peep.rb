require 'pg'

class Peep

  def initialize(content)
    @content = content
    @user_id = null
    @timestamp = null
  end

  def self.all_peeps
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'peep_manager_test')
    else
      connection = PG.connect(dbname: 'peep_manager')
    end
    result = connection.exec("SELECT * FROM peeps;")
    result.map { |peep| peep['content'] }
  end

  def self.create_peep(content:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'peep_manager_test')
    else
      connection = PG.connect(dbname: 'peep_manager')
    end
    connection.exec("INSERT INTO peeps (content) VALUES('#{content}')")
  end
end
