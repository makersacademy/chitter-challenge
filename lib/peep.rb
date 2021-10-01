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
      Peep.new(id: peep['id'], name: peep['name'], content: peep['content'], created_at: peep['created_at'], user_id: peep['user_id'])
    end
  end

  def self.create(name:, content:, user_id:)
    connection = 
    if ENV['RACK_ENV'] == 'test'
      PG.connect(dbname: 'chitter_test')
    else
      PG.connect(dbname: 'chitter')
    end
    new_peep = connection.exec("INSERT INTO peeps (name, content, created_at, user_id) VALUES('#{name}', '#{content}', '#{Time.now}', '#{user_id}') RETURNING id, name, content, created_at, user_id;")
    Peep.new(id: new_peep[0]['id'], name: new_peep[0]['name'], content: new_peep[0]['content'], created_at: new_peep[0]['created_at'], user_id: new_peep[0]['user_id'])
  end

  def initialize(id:, name:, content:, created_at:, user_id:)
    @id = id
    @name = name
    @content = content
    @created_at = created_at
    @user_id = user_id
  end
end
