# Peep class, takes care of all peeps
require 'date'
require './lib/database_connection'

class Peep
  attr_reader :peep_id, :peep, :time, :username
  def initialize(peep_id, peep, time, username)
    @peep_id = peep_id
    @peep = peep
    @time = time
    @username = username
  end

  def self.show_all
    make_array(fetch_records)
    # puts stuff.first.peep
    # stuff
  end

  def self.add(user_id, peep)
    DatabaseConnection.query("insert into peeps (user_id, peep, date)
    values(#{user_id},'#{peep}', '#{Time.now}');")
  end

  private_class_method

  def self.fetch_records
    DatabaseConnection.query("SELECT peeps.id, peeps.peep, peeps.date,
      users.username FROM peeps INNER JOIN users ON peeps.user_id=users.id ORDER BY peeps.date DESC;")
  end

  def self.fix_time(time)
    Time.parse(time).strftime("%d/%m/%Y at %I:%M%p")
  end

  def self.make_array(peeps)
    peeps.map { |p| Peep.new(p['id'], p['peep'], fix_time(p['date']), p['username']) }
  end

  def self.delete_peeps(user_id)
    # TODO:
    DatabaseConnection.query("DELETE FROM peeps WHERE user_id =#{user_id}")
  end

end
