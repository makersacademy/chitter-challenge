require 'pg'

class Chitter

  # def self.all
  #   if ENV['ENVIRONMENT'] == 'test'
  #     conn = PG.connect( dbname: 'chits_test')
  #   else
  #     conn = PG.connect( dbname: 'chits')
  #   end
  #   chits = conn.exec("SELECT * FROM chits")
  #   chits.map { |chit| chit['msg'] }
  # end

end
