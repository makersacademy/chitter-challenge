require 'pg'

class Peep

  attr_reader :id, :time, :text

  def initialize(id:, time:, text:)
    @id = id
    @time = time
    @text = text
  end

  def self.create(text:)
    if ENV['ENVIRONMENT'] == 'test'
      conn = PG.connect(dbname: 'chitter_challenge_test')
    else
      conn = PG.connect(dbname: 'chitter_challenge')
    end
    t = Time.now
    result = conn.exec("INSERT INTO peeps (text, time) VALUES('#{text}', '#{t.strftime('%k:%M:%S')}') RETURNING id, time, text")
    Peep.new(id: result[0]['id'], time: result[0]['time'], text: result[0]['text'])
  end

end
