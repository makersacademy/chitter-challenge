require "pg"

class Peep
  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'peeps_manager_test')
    else
      connection = PG.connect(dbname: 'peeps')
    end

    result = connection.exec("SELECT * FROM peeps_management")
    result.map { |peeps| peeps['peep'] }
  end
end
