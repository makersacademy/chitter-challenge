class Peep
  def self.create(content:, created_at:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec("INSERT INTO peeps (content, created_at) values ('#{content}', '#{created_at}') RETURNING id, content, created_at;")
    Peep.new(content: result[0]['content'], created_at: result[0]['created_at'])
  end

  attr_reader :content, :created_at

  def initialize(content:, created_at:)
    @content = content
    @created_at = created_at
  end
end
