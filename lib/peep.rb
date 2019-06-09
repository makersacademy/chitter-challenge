require 'pg'

class Peep
  attr_reader :id, :content, :user_id

  def initialize(id, content, user_id)
    @id = id
    @content = content
    @user_id = user_id
  end

  def self.post(text)
    connection = if ENV['ENVIRONMENT'] == 'test'
                   PG.connect(dbname: 'chitter_manager_test')
                 else
                   PG.connect(dbname: 'chitter_manager')
                 end
    connection.exec("INSERT INTO peeps (content) VALUES('#{text} -#{Time.now.strftime("posted %a, %-d %b at %I:%M%p")}');")
  end

  def self.all
    connection = if ENV['ENVIRONMENT'] == 'test'
                   PG.connect(dbname: 'chitter_manager_test')
                 else
                   PG.connect(dbname: 'chitter_manager')
                 end
    result = connection.exec('SELECT * FROM peeps ORDER BY id DESC;')
    result.map { |peep| Peep.new(peep['id'], peep['content'], peep['user_id']) }
  end

end
