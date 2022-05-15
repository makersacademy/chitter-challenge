require 'pg'

class Peeps
  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec("SELECT handle, first_name, peep FROM peeps;")
    result.map { |peep| "#{peep['first_name']} (#{peep['handle']}): #{peep['peep']}"}
  end

  def self.new_peep(first_name, handle, peep)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    connection.exec("INSERT INTO peeps (handle, first_name, peep) VALUES ('#{handle}','#{first_name}', '#{peep}');")
  end
end