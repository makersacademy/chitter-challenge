require 'pg'

# class for peep object
class Peeps

  @database = if ENV['Environment'] == 'test'
                p "Test environment"
                PG.connect(dbname: 'Chitter_test')
              else
                p "Standard environment"
                PG.connect(dbname: 'Chitter')
              end

  def self.post_peep(peep)
    @database.exec("INSERT INTO peeps (peep) VALUES('#{ peep }')")
  end

  def self.peep_list
    result = @database.exec('SELECT * FROM peeps')
    result.map { |peep| { peep: peep['peep'] } }
  end
end
