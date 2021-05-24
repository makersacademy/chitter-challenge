require 'byebug'
require 'pg'
require 'time'

class Peep
  

attr_reader :id, :content, :user_id, :time_created, :name, :user_name

 def initialize(id:, content:, user_id:, time_created:, user_class: User)
    @id  = id
    @content = content
    @user_id = user_id
    @time_created = time_created
    @name = user_class.find(user_id).name
    @user_name = user_class.find(user_id).username
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_app_test')
    else
      connection = PG.connect(dbname: 'chitter-app')
    end
    
    result = connection.exec("SELECT * FROM peeps")
    result.map do |peep|
      Peep.new(id: peep['id'], content: peep['content'], user_id: peep['user_id'], time_created: Time.parse(peep['time_created']))
    end
  end

  def self.create(content:, user_id:)
    if ENV['ENVIRONMENT'] == 'test'
        connection = PG.connect(dbname: 'chitter_app_test')
      else
        connection = PG.connect(dbname: 'chitter-app')
      end

      result = connection.exec("INSERT INTO peeps (content, user_id) VALUES('#{content}', #{user_id}) RETURNING id, content, user_id, time_created;")

      Peep.new(id: result[0]['id'], content: result[0]['content'], user_id: result[0]['user_id'],time_created: Time.parse(result[0]['time_created']))
  end
  
end 