require_relative 'connection'

class Cheetah
  attr_reader :username
  def initialize(username)
    @username = username
  end

  def self.request(name, pword)
    result = Connection.query("SELECT * FROM cheetahs WHERE(username = '#{name}' AND password = '#{pword}')")
    return false unless result.any?
    Cheetah.new(result[0]["username"])
  end

  def self.create(username, password)
    Connection.query("INSERT INTO cheetahs(username, password) VALUES('#{username}', '#{password}')").first
  end
end
