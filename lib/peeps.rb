require 'pg'

class Peeps

  attr_reader :text, :time, :user

  def initialize(text, time, user)
    @text = text
    @time = time
    @user = user
  end

  def self.all
    database_connection
    all_peeps = @connection.exec("SELECT * FROM peeps ORDER BY time DESC;")
    all_peeps.map { |text| Peeps.new(text["peep"], text["time"], text["username"]) }
  end

  def self.post(text, username)
    database_connection
    @connection.exec("INSERT INTO peeps (peep, time, username) VALUES ('#{sanitize(text)}', 'NOW', '#{sanitize(username) if !username.nil?}');") if text.length > 0
  end

  private

  def self.sanitize(string)
    string.gsub(/'/, "&#39;").gsub(/"/, '&#34;')
  end

  def self.database_connection
    if ENV['ENVIRONMENT'] == 'test'
      @connection = PG.connect(dbname: 'chitter_test')
    else
      @connection = PG.connect(dbname: 'chitter')
    end
  end

end
