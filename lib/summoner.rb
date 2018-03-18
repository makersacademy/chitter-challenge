class Summoner
  attr_reader :username, :email

  def initialize(username, email, password)
    @username = username
    @email = email
    @password = password
  end

  def self.all
    @all = []
    @result = DB_Connection.query('SELECT * FROM summoners ORDER BY user_id DESC')
    @result.map { |summoner| @all << Summoner.new(summoner['username'], summoner['email'], summoner['password']) }
    @all
  end

  def self.create(username, email, password)
    DB_Connection.query("INSERT INTO summoners (username, email, password) VALUES ('#{username}', '#{email}', '#{password}');")
  end

  def self.find(user_id)
    @summoner = []
    @result = DB_Connection.query("SELECT * FROM summoners WHERE user_id = #{user_id}")
    @result.map { |summoner| @summoner << Summoner.new(summoner['user_id'], summoner['username'], summoner['email']) }.first
    @summoner
  end

end
