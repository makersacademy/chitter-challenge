require 'pg'

class Peep
  attr_reader :id, :text, :time, :user_id

  def initialize(id, text, time, user_id)
    @id = id
    @text = text
    @time = time
    @user_id = user_id
  end

  def self.all(connection = connect_to_database)
    result = connection.exec 'SELECT * FROM peeps'
    result.map { |row| Peep.new(row['id'], row['text'], row['time'], row['user_id']) }
  end

  def self.create(text, user_id, connection = connect_to_database)
    connection.exec "INSERT INTO peeps(text, time, user_id) VALUES('#{text}', '#{Time.now}', '#{user_id}')"
  end

  private

  def self.connect_to_database
    if ENV['RACK_ENV'] == 'test'
      PG.connect dbname: 'chitter_test'
    else
      PG.connect dbname: 'chitter'
    end
  end
end
