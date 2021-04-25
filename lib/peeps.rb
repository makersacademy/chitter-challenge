class Peeps 
  def self.all 
    if ENV['RACK_ENV'] == 'test'
      con = PG.connect(dbname: 'chitter_test')
    else 
      con = PG.connect(dbname: 'chitter')
    end
    
    chitter = con.exec('SELECT * FROM peeps')
    chitter.map {|peeps| peeps['peep']}
  end
end