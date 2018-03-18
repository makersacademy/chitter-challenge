class Summoner
  attr_reader :username, :email

  def initialize(username, email)
    @username = username
    @email = email
  end

  def self.create(username, email)
    @summoner = Summoner.new(username, email)
    @all_summoners ||= []
    @all_summoners << @summoner
    @summoner
  end

  def self.find(user_query)
    @result = @all_summoners.select { |summoner| summoner.username == user_query}
  end

end
