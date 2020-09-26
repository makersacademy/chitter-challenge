require 'pg'
require_relative './database_connection.rb'

class Peep

  attr_reader :id, :text, :time, :date, :user_id

  def self.create(text:, user_id:)
    Peep.set_environment

    @connection = DatabaseConnection.connection
    clock = Time.new
    time = "#{clock.hour}:#{clock.min}"
    date = "#{clock.year}-#{clock.month}-#{clock.day}"

    result = DatabaseConnection.query("INSERT INTO peeps (text, time, date, user_id) VALUES('#{text}', '#{time}', '#{date}', '#{user_id}')RETURNING id, text, time, date, user_id;")
    
    Peep.new(id: result[0]['id'], text: result[0]['text'], time: result[0]['time'], date: result[0]['date'], user_id: result[0]['user_id'])
  end

  def initialize(id:, text:, time:, date:, user_id:)
    @id = id
    @text = text
    @time = time
    @date = date
    @user_id = user_id
  end

private 
  def self.set_environment
    if ENV['ENVIRONMENT'] == 'test'
      DatabaseConnection.setup('chitter_test')
    else
      DatabaseConnection.setup('chitter')
    end
  end
end
