require 'pg'
require_relative './user.rb'

class Peep
  attr_reader :id, :user_id, :content, :time

  def initialize(id, user_id, content, time)
    @id = id
    @user_id = user_id
    @content = content
    @time = DateTime.parse(time)
  end

  def self.create(content, user_id)
    Peep.switch_db_if_test_env
    time = Time.now
    peep = @con.exec("INSERT INTO peeps (user_id, content, time)
                      VALUES ('#{user_id}', '#{content}', '#{time}')
                      RETURNING id, user_id, content, time;")
    Peep.new(peep.first['id'], peep.first['user_id'], peep.first['content'],
             peep.first['time'])
  end

  def self.all
    User.switch_db_if_test_env
    peeps = @con.exec("SELECT * FROM peeps")
    peeps.map { |peep| Peep.new(peep['id'], peep['user_id'], peep['content'],
                                peep['time'])}
  end

  def self.switch_db_if_test_env
    ENV['ENVIRONMENT'] == 'test' ? dbname = 'chitter_test' : dbname = 'chitter'
    @con = PG.connect :dbname => "#{dbname}"
  end

  # Compare users by id rather than instance
  def ==(other)
    @id == other.id
  end
end
