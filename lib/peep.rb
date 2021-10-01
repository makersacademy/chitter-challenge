require 'pg'

class Peep
  attr_reader :id, :name, :content, :created_at, :user_id

  def self.all
    connection = 
    if ENV['RACK_ENV'] == 'test'
      PG.connect(dbname: 'chitter_test')
    else
      PG.connect(dbname: 'chitter')
    end
    peeps = connection.exec("SELECT * FROM peeps")
    peeps.map do |peep|
      user = connection.exec("SELECT * FROM users WHERE id = #{peep['user_id']};")
      Peep.new(id: peep['id'], name: user[0]['username'], content: peep['content'], created_at: peep['created_at'], user_id: peep['user_id'])
    end
  end

  def self.create(content:, user_id:)
    connection = 
    if ENV['RACK_ENV'] == 'test'
      PG.connect(dbname: 'chitter_test')
    else
      PG.connect(dbname: 'chitter')
    end
    new_peep = connection.exec("INSERT INTO peeps (content, created_at, user_id) VALUES('#{content}', '#{Time.now}', '#{user_id}') RETURNING id, content, created_at, user_id;")
    user = connection.exec("SELECT * FROM users WHERE id = #{user_id};")
    Peep.new(id: new_peep[0]['id'], name: user[0]['username'], content: new_peep[0]['content'], created_at: new_peep[0]['created_at'], user_id: new_peep[0]['user_id'])
  end

  def initialize(id:, name:, content:, created_at:, user_id:)
    @id = id
    @name = name
    @content = content
    @created_at = created_at
    @user_id = user_id
  end
end
