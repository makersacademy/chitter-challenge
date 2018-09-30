require_relative 'database_connection'

class Peeps

  def self.all
    peeps = DatabaseConnection.exec("SELECT * FROM peeps")
    result = peeps.map do |peep|
      Peeps.new(peep['id'], peep['content'], peep['time'], peep['email'])
    end
    result.sort { |x,y| y.time <=> x.time }
  end

  def self.create(content,email)
    DatabaseConnection.exec("INSERT INTO peeps (content, time, email) VALUES ('#{content}', '#{Time.new}', '#{email}')")
  end

  def initialize(id,content,time,email)
    @id = id
    @content = content
    @time = time
    @email = email
  end

  attr_reader :id, :content, :time, :email
end
