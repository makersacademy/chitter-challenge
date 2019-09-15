require 'pg'

class Peeps
  def self.all
    result = self.connect.exec("SELECT * FROM peeps_library;")
    result = result.map { |peep| peep['peeps'] }
    result.reverse
  end

  private_class_method

  def self.connect
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'peeps_test')
    else
      connection = PG.connect(dbname: 'peeps')
    end
  end

end
