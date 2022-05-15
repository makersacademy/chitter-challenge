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
end