class Peep
  def self.all

    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    p result = connection.exec("SELECT * FROM peeps")
    p result.map { |peep| { content: peep['content'], user: peep['username'], handle: peep['userhandle'] } }

 
  end

end