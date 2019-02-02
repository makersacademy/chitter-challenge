require 'pg'

class Message

  def self.all
    @result = self.connection.exec("SELECT * FROM peeps;")
    @result.map { |peep| peep['peep']}
  end

  private

  def self.connection
  if ENV['ENVIRONMENT'] == 'test'
    PG.connect(dbname: 'chitter_peeps_test')
  else
    PG.connect(dbname: 'chitter_peeps')
  end
end

end
