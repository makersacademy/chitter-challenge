require 'pg'

class Peep

  def self.all
      connection = PG.connect(dbname: 'peep_manager')
      result = connection.exec("select * from peeps")
      result.map{|bookmark| bookmark['peep']}
  end

end
