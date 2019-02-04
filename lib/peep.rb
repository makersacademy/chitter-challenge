require 'pg'
class Peep

  attr_reader :poster_id, :peep_content, :posted_at

  def initialize(poster_id:, peep_content:, posted_at:)
    @poster_id = poster_id
    @peep_content = peep_content
    @posted_at = posted_at
  end

  def self.list
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter-test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec("SELECT poster_id, peep_content,
      to_char(posted_at, 'HH24:MI:SS, DD/MM/YYYY') FROM peeps ORDER BY id DESC")
    result.map do |peep|
      Peep.new(poster_id: peep['poster_id'], peep_content: peep['peep_content'], posted_at: peep['to_char'])
    end
  end

  def self.post_new_peep(peep_content)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter-test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec("INSERT INTO peeps(id, peep_content, posted_at)
    VALUES(DEFAULT, '#{peep_content}', NOW())
    RETURNING poster_id, peep_content, posted_at;")
    Peep.new(poster_id: result[0]['poster_id'], peep_content: result[0]['peep_content'], posted_at: result[0]['posted_at'])
  end

end
