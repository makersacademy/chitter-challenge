class Entry
  attr_reader :text, :posting_date

  def initialize(text, posting_date)
    @text = text
    @posting_date = posting_date
  end

  def self.add(peep)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')    
    else      
      connection = PG.connect(dbname: 'chitter')  
    end
    #ENV['ENVIRONMENT'] == 'test' ? dbname = 'chitter_test' : dbname = 'chitter'
    #connection = PG.connect(dbname: 'chitter')
    connection.exec("INSERT INTO entry (text) VALUES ('#{peep}');")
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')    
    else      
      connection = PG.connect(dbname: 'chitter')  
    end
    #ENV['ENVIRONMENT'] == 'test' ? dbname = 'chitter_test' : dbname = 'chitter' 
    #connection = PG.connect(dbname: 'chitter')
    result = connection.exec("SELECT * FROM entry;")
    result.map do |peep| Entry.new(peep['text'], peep['posting_date'])
    end
  end

end