require 'pg'

class Peep
  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'peep_manager_test')
    else
      connection = PG.connect(dbname: 'peep_manager')
    end
    result = connection.exec("SELECT * FROM peeps;")
    result.map do |peep|
      peep["content"]
    end
  end

  def self.create(content:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'peep_manager_test')
    else
      connection = PG.connect(dbname: 'peep_manager')
    end
    connection.exec("INSERT INTO peeps (name, username, content, time) VALUES ('Jason Wong', 'jasylw', '#{content}', '#{Time.now.getutc}');")
  end
end
