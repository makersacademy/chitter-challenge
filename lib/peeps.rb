require 'pg'

# class for peep object
class Peeps

  # determines whether test or development database is accessed
  @database = if ENV['ENVIRONMENT'] == 'test'
                p "Establishing Test environment"
                PG.connect(dbname: 'Chitter_test')
              else
                PG.connect(dbname: 'Chitter')
              end

  # posting peep method
  def self.post_peep(peep)
    time = Time.now.strftime("%k:%M %d/%m/%Y")
    @database.exec("INSERT INTO peeps (peep, time) VALUES('#{peep}', '#{time}')")
  end

  def self.peep_list
    result = @database.exec('SELECT * FROM peeps')
    (result.map { |peep| { peep: peep['peep'], time: peep['time'] } }).reverse
  end
end
