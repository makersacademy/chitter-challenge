require 'pg'

# class for peep object
class Peeps
  
  @database = PG.connect(dbname: 'Chitter')

  def self.post_peep(peep)
    @database.exec("INSERT INTO peeps (peep) VALUES('#{peep}')")
  end

  def self.peep_list
    result = @database.exec('SELECT * FROM peeps')
    result.map{ |peep| { peep: peep['peep'] } }
  end
end
