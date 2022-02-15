class Peep 

  def self.find_by_id(id)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec("SELECT * FROM peeps WHERE id = #{id}") 
    result.map { |peep| peep['peep'] }.first
  end

  def self.create(peep)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    
    result = connection.exec("INSERT INTO peeps (peep) VALUES ('#{peep}') RETURNING id") 
    result.map { |id| id['id'] }.first
  end
end