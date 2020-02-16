require 'pg'
require_relative 'database_connection'

class Peep  
  attr_reader :id, :text, :time_created, :user_id

  def initialize(id:, text:, time_created:, user_id:)
    @id  = id
    @text = text
    @time_created = time_created
    @user_id = user_id
  end
    
  def self.all    
    peeps = DatabaseConnection.query("SELECT * FROM peeps")
    peeps.map do |peep|
      Peep.new(
        id: peep['id'], 
        text: peep['text'], 
        time_created: peep['time_created'],
        user_id: peep['user_id']
        )
    end
  end

  def self.create(text:)
    result = DatabaseConnection.query("INSERT INTO peeps (text) VALUES('#{text}') RETURNING id, text, time_created, user_id;")
    Peep.new(id: result[0]['id'], text: result[0]['text'], time_created: result[0]['time_created'], user_id: result[0]['user_id'])
  end
end