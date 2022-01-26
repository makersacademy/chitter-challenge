require 'pg'
require 'time'
# require_relative './user'

class Peep 

  attr_reader :id, :text, :time, :user_id

  def initialize(id:, text:, time:, user_id:)
    @id = id
    @text = text
    @time = time
    @user_id = user_id
  end

  def self.all 
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end  
    
    result = connection.exec("SELECT * FROM peeps INNER JOIN users ON peeps.user_id = users.id ORDER BY peeps.id DESC;")
    result.map do |peep|
      Peep.new(id: peep['id'], text: peep['text'], time: peep['time'], user_id: peep['username']) 
    end
  end

  def self.create(text:, user_id:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end  

    result = connection.exec(
      "INSERT INTO peeps (text, time, user_id) VALUES('#{text}', '#{Time.now}', '#{user_id}') RETURNING id, text, time, user_id;"
    )
    Peep.new(id: result[0]['id'], text: result[0]['text'], time: result[0]['time'], user_id: result[0]['user_id'])
  end

end
