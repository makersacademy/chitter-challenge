require 'pg'
require_relative 'databaseconnection'

class Peeps
  attr_reader :id, :username, :peep, :lastmodified

  def initialize(id:, username:, peep:, lastmodified:) 
    @id = id
    @username = username
    @peep = peep
    @lastmodified = lastmodified
  end

  def self.all 
    result = DatabaseConnection.query("SELECT * FROM peeps;")
    result.map do |peep|
      Peeps.new(id: peep['id'], username: peep['username'], peep: peep['peep'], lastmodified: Time.parse(peep['lastmodified']).strftime("%d/%m/%Y %k:%M"))
    end
  end

  def self.create(username:, peep:)
    DatabaseConnection.query("INSERT INTO peeps (username, peep) VALUES('#{username}', '#{peep}')")
  end

  # def time_formatter
  #   formatted_time = Time.new(@lastmodified)
  #   @lastmodified = formatted_time.strftime("%d/%m/%Y %k:%M")
  # end

end
