require 'pg'

class Peep
  attr_reader :id, :content, :timestamptz

  def initialize(id:, content:, timestamptz:)
    @id = id
    @content = content
    @timestamptz = timestamptz
  end

  def self.all
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec("SELECT * FROM peeps;")
    result.map do |peep|
      Peep.new(id: peep['id'], content: peep['content'], timestamptz: peep['timestamptz'])
    end
      .reverse
  end

  def self.create(content:, timestamptz: Time.now)
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    connection.exec("INSERT INTO peeps (content, timestamptz) VALUES ('#{content}', '#{timestamptz}') RETURNING id, content, timestamptz")
  end
end
