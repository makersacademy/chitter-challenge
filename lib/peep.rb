class Peep
  def self.create(content:, created_at:)
    connection = check_environment

    result = connection.exec("INSERT INTO peeps (content, created_at) values ('#{content}', '#{created_at}') RETURNING id, content, created_at;")
    Peep.new(id: result[0]['id'], content: result[0]['content'], created_at: result[0]['created_at'])
  end

  def self.all
    connection = check_environment

    result = connection.exec("SELECT * FROM peeps ORDER BY created_at DESC;")
    result.map do |peep|
      Peep.new(id: peep['id'], content: peep['content'], created_at: peep['created_at'])
    end
  end

  attr_reader :id, :content, :created_at

  def initialize(id:, content:, created_at:)
    @id = id
    @content = content
    @created_at = created_at
  end
  
  private

  def self.check_environment
    if ENV['ENVIRONMENT'] == 'test'
      PG.connect(dbname: 'chitter_test')
    else
      PG.connect(dbname: 'chitter')
    end
  end

end
