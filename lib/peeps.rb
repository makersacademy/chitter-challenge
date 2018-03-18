require_relative './database_connection_setup.rb'

class Peeps
  attr_reader :id, :date, :tweet

  def initialize(id, date, tweet)
    @id = id
    @date = date
    @tweet = tweet
  end

  def self.all
    result = DatabaseConnection.query('SELECT * FROM peeps ORDER BY id DESC')
    result.map { |peeps| Peeps.new(peeps['id'], peeps['date'], peeps['tweet']) }

  end

  def self.create(text, time = Time.new.to_s.rpartition('')[0].to_s)
    DatabaseConnection.query("INSERT INTO peeps (tweet,date) VALUES ('#{text[:tweet]}','#{time}')")
  end
end

def self.post
 end
