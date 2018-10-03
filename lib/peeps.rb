require_relative 'database_connection'

class Peeps

  def self.all
    peeps = DatabaseConnection.exec("SELECT * FROM peeps")
    result = peeps.map do |peep|
      Peeps.new(peep['id'], peep['content'], peep['time'], peep['name'], peep['username'])
    end
    result.sort { |x,y| y.time <=> x.time }
  end

  def self.create(content,name,username)
    DatabaseConnection.exec("INSERT INTO peeps (content, time, name, username) VALUES ('#{content}', '#{Time.new}', '#{name}', '#{username}')")
  end

  def initialize(id,content,time,name,username)
    @id = id
    @content = content
    @time = time
    @name = name
    @username = username
  end

  attr_reader :id, :content, :time, :email, :name, :username
end
