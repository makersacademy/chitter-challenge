#require 'uri'

class Peeps
  attr_reader :peep, :name, :username, :created_at

  def initialize(peep, name, username, created_at)
    @name = name
    @username = username
    @peep = peep
    @created_at = created_at
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps NATURAL JOIN users ORDER BY created_at DESC")
    result.map { |peep| Peeps.new(peep['peep'], peep['name'], peep['username'], peep['created_at']) }
  end

  def self.post(options)
    DatabaseConnection.query("INSERT INTO peeps (peep, uid) VALUES('#{options[:peep]}', '#{options[:uid]}')")
  end

end
