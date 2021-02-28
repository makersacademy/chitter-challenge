class Peep
  def self.create(content:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec("INSERT INTO peeps (content, created_at) values ('#{content}', CURRENT_TIMESTAMP(0)) RETURNING id, content, created_at;")
    Peep.new(content: result[0]['content'])
  end

  attr_reader :content

  def initialize(content:)
    @content = content
  end
end
