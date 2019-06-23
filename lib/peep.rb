require 'pg'

class Peep

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    peeps = connection.exec("SELECT * FROM chitter;")
    peeps.map do |peep|
      Peep.new(
        id: peep['id'], 
        username: peep['username'], 
        text: peep['text']
        )
    end
  end

  def self.create(username:, text:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    peeps = connection.exec("INSERT INTO chitter (username, text) VALUES('#{username}', '#{text}') RETURNING id, username, text;")
    Peep.new(id: peeps[0]['id'], username: peeps[0]['username'], text: peeps[0]['text'])
  end

  attr_reader :id, :username, :text

  def initialize(id:, username:, text:)
    @id = id
    @username = username
    @text = text
  end

end