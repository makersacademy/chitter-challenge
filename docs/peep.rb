require 'pg'

class Peep

  attr_reader :peep_id, :post_date, :content

  def initialize(peep_id:, post_date:, content:)
    @peep_id = peep_id
    # manululate Timestamp to remove decimal seconds
    @post_date = post_date.to_s[0..18]
    @content = content
  end

  def self.view_peeps
    connection = PG.connect(dbname: 'chitter')
    
    result = connection.exec("SELECT * FROM chitter ORDER BY post_date DESC;")
    result.map do |peep|
      Peep.new(peep_id: peep['peep_id'], post_date: peep['post_date'], content: peep['content'])
    end
  end

  def self.create(content:)
    
    connection = PG.connect(dbname: 'chitter')
    
    result = connection.exec_params("INSERT INTO chitter (content) VALUES($1) RETURNING peep_id, post_date, content;", [content])    
    Peep.new(peep_id: result[0]['peep_id'], post_date: result[0]['post_date'], content: result[0]['content'])
  end
    
end