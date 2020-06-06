require 'date'
require_relative 'user'

class Chitter

  attr_reader :body, :time, :username, :peep_id

  def self.all
    results = DatabaseConnection.query("SELECT * FROM peeps JOIN users ON peeps.user_id = users.id ORDER BY datetime DESC LIMIT 10")
    results.map { |peep| Chitter.new(peep['body'], peep['datetime'], peep['username'], peep['peep_id'])}
  end

  def self.add_peep(body)
    DatabaseConnection.query("INSERT INTO peeps (body, user_id, datetime) VALUES ('#{body}', '#{User.current_user.id}','#{Time.now}')")
  end

  def self.delete(peep_id)
    DatabaseConnection.query("DELETE FROM peeps WHERE peep_id='#{peep_id}'")
  end

  def self.edit(body, id)
    DatabaseConnection.query("UPDATE peeps SET body = '#{body}' WHERE peep_id = '#{id}'")
  end

  def self.find_peep(id)
    @peep_for_edit
    all.each { |peep| @peep_for_edit = peep if peep.peep_id == id }
    @peep_for_edit
  end

  def initialize(body, datetime, username, peep_id = nil)
    @peep_id = peep_id
    @body = body
    @time = format_date(datetime)
    @username = username
  end

  def format_date(date)
      Time.parse(date).strftime('%d %b %y')
  end

end
