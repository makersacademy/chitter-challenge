require 'pg'
require_relative 'database'

class Cheet

  attr_reader :id, :user, :cheet, :timestamp

  def initialize(id, user, cheet, timestamp)
    @id = id
    @user = user
    @cheet = cheet
    @timestamp = timestamp
  end

  def self.all
    result = Database.query("SELECT * FROM cheets")
    result.map do |row|
      Cheet.new(row['id'], row['username'], row["cheet"], row['timestamp'])
    end
  end

  def self.create(cheet, username)
    Database.query("INSERT INTO cheets (cheet, username) VALUES ('#{cheet}', '#{username}');")
  end

end
