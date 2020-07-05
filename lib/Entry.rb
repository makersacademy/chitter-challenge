class Entry
  attr_reader :text, :posting_date

  def initialize(text, posting_date)
    @text = text
    @posting_date = posting_date
  end

  def self.add(peep)
    ENV['ENVIRONMENT'] == 'test' ? db_name = 'chitter_test' : db_name = 'chitter'
    connection = PG.connect(dbname: 'chitter')
    connection.exec("INSERT INTO entry (text) VALUES ('#{peep}');")
  end

  def self.all
    ENV['ENVIRONMENT'] == 'test' ? db_name = 'chitter_test' : db_name = 'chitter' 
    connection = PG.connect(dbname: 'chitter')
    result = connection.exec("SELECT * FROM entry;")
    result.map do |peep| Entry.new(peep['text'], peep['posting_date'])
    end
  end

end