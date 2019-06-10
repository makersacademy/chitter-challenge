require 'pg'
require_relative 'database_connect'

class Peep 
  attr_reader :id, :user_id, :name, :username, :text, :date_time

  def initialize(id:, user_id:, name:, username:, text:, date_time:)
    @id = id
    @user_id = user_id
    @text = text
    @name = name
    @username = username
    @date_time = date_time
  end

  def self.all
    result = DatabaseConnection.query('SELECT peeps.id, user_id, text, users.username, users.name, date_time 
                                    FROM peeps JOIN users ON peeps.user_id = users.id
                                    ORDER BY date_time DESC')
    result.map do |peep|
      Peep.new(id: peep['id'], user_id: peep['user_id'], name: peep['name'], username: peep['username'], text: peep['text'], date_time: peep['date_time'])
    end
  end 

  def self.add(user_id:, text:, date_time:)
    DatabaseConnection.query("INSERT INTO peeps (user_id,text,date_time) 
                      VALUES (#{user_id},'#{text}', '#{date_time}')")
  end 
end 