require 'pg'

class Peep
  attr_reader :name, :user_name, :timestamp, :content

  def initialize(name, user_name, timestamp, content)
    @name = name
    @user_name = user_name
    @timestamp = timestamp
    @content = content
  end

  def self.all
    connection = PG.connect(dbname: "chitter#{'_test' if ENV['ENVIRONMENT'] == 'test'}")
    result = connection.exec('SELECT chit_user."name",
      chit_user.user_name, peeps."timestamp", peeps."content"
      FROM peeps
        INNER JOIN chit_user ON chit_user.chit_user_id = PEEPS.chit_user_id
      ORDER BY timestamp DESC;')
    result.map { |dbrow| Peep.new(dbrow['name'], dbrow['user_name'], dbrow['timestamp'], dbrow['content']) }
  end
end
