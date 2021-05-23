require 'pg'

class Message

  attr_reader :text, :user_name, :id

  def initialize(text, user_name, id)
    @text = text
    @user_name = user_name
    @id = id
  end


  def self.all
    if ENV['ENVIRONMENT'] = 'test'
      con = PG.connect(dbname: 'chitter_test')
    else
      con = PG.connect(dbname: 'chitter')
    end

    result = con.exec("SELECT * FROM messages")
    result.map do |message| 
      Message.new(message['text'], message['user_name'], message['id'])
    end
  end

  def self.create(text, user_name)
    if ENV['ENVIRONMENT'] = 'test'
      con = PG.connect(dbname: 'chitter_test')
    else
      con = PG.connect(dbname: 'chitter')
    end

    result = con.exec("INSERT INTO messages (text, user_name) VALUES ('#{text}', '#{user_name}') RETURNING *")
    Message.new(result[0]['text'], result[0]['user_name'], result[0]['id'])
  end 

end