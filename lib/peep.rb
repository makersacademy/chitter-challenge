require 'pg'

class Peep
  def self.add(content:)
    prs_data = database_connect.exec_params("INSERT INTO peeps (content, created_at) VALUES ($1, now()) RETURNING id, content, created_at;", [content])
    Peep.new(id: prs_data[0]['id'], content: prs_data[0]['content'], created_at: prs_data[0]['created_at'])
  end

  def self.get_all
    output = database_connect.query("SELECT * FROM peeps;")
    peeps = output.map { |peep_data| Peep.new(id: peep_data['id'], content: peep_data['content'], created_at: peep_data['created_at'])}
    peeps.sort { |a, b| b.created_at? <=> a.created_at?  }
  end
  
  def self.database_connect
    ENV['ENVIRONMENT'] == 'test' ? PG.connect(dbname: 'chitter_test') : PG.connect(dbname: 'chitter')
  end
  
  attr_reader :id, :content
  
  def initialize(id:, content:, created_at:)
    @id = id
    @content = content
    @created_at = created_at
  end

  def created_at?
    @created_at
  end
end
