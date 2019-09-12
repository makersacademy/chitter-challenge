require 'pg'

class Peeps

  def self.all
    connection = PG.connect(dbname: 'chitter') #connects to db
    result = connection.exec("SELECT * FROM peeps_timeline") #displays tables
    result.map { |post| post['peep'] }#displays each peep post individually
  end
end
