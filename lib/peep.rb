# Peep class, takes care of all peeps
require 'date'
require './lib/database_connection'

class Peep
  attr_reader :peep_id, :peep, :date, :username
  def initialize(peep_id, peep, date, username)
    @peep_id = peep_id
    # @user_id = user_id
    @peep = peep
    @date = date
    @username = username
  end

  def self.show_all
    peeps = DatabaseConnection.query("SELECT peeps.id, peeps.peep, peeps.date,
      users.username FROM peeps INNER JOIN users ON peeps.user_id=users.id;")
    peeps.map { |p| Peep.new(p['id'], p['peep'], p['date'], p['username']) }
  end

  def self.add(user_id, peep)
    DatabaseConnection.query("insert into peeps (user_id, peep)
    values(#{user_id},'#{peep}');")
  end
end


# TODO: delete user's tweets if user is deleted
# TODO: add a nav bar with options to log in, out and delete account
# TODO: RESTful
# TODO: tag users
# TODO: email when tagged or sign up
