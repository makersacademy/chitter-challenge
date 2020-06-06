require 'date'
require_relative 'user'

class Chitter

  attr_reader :body, :time, :username, :peep_id

  def self.all
    select_query = "SELECT * FROM peeps
      JOIN users ON peeps.user_id = users.id ORDER BY datetime DESC"
    results = DatabaseConnection.query(select_query)
    results.map { |peep| Chitter.new(peep['body'], peep['datetime'], peep['username'], peep['peep_id']) }
  end

  def self.add_peep(body)
    add_query = "INSERT INTO peeps (body, user_id, datetime)
      VALUES ('#{body}', '#{User.current_user.id}','#{Time.now}')"
    DatabaseConnection.query(add_query)
  end

  def self.delete(peep_id)
    DatabaseConnection.query("DELETE FROM peeps WHERE peep_id='#{peep_id}'")
  end

  def self.edit(body, id)
    edit_query = "UPDATE peeps SET body = '#{body}' WHERE peep_id = '#{id}'"
    DatabaseConnection.query(edit_query)
  end

  def self.find_peep(id)
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
    if Date.today == Date.parse(date)
      DateTime.parse(date).strftime('%k:%M')
    else
      Time.parse(date).strftime('%d %b %y')
    end
  end

end
