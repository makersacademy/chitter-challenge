require 'pg'
require_relative './database_connection'

class Peep 
  attr_reader :user_id, :create_time, :body

  def initialize(user_id:, create_time:, body:)
    @user_id = user_id
    @create_time = create_time
    @body = body
  end

  def self.all
    peeps = DatabaseConnection.query('SELECT * FROM peeps ORDER BY create_time DESC;')
    peeps.map do |peep|
      Peep.new(
        user_id: peep['user_id'],
        create_time: peep['create_time'],
        body: peep['body']
      )
    end
  end
end