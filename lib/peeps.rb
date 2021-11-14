# frozen_string_literal: true

require 'pg'

# Manages the peeps database
class Peeps

  attr_reader :peep, :time, :username, :fullname

  def initialize(peep, time, username, fullname)
    @peep = peep
    @time = time
    @username = username
    @fullname = fullname
  end

  class << self
    def all(peeps = retrieve_peeps)
      peeps.map { |pp| create_peep_object(pp) }.reverse
    end

    private

    def create_peep_object(pp)
      Peeps.new(pp['peep'], pp['peep_time'], pp['peep_user'],user_fullname(pp['peep_user']))
    end

    def user_fullname(username)
      connection.query("SELECT * FROM users WHERE username = '#{username}';").first['fullname']
    end

    def retrieve_peeps
      connection.exec('SELECT * FROM peeps')
    end

    def connection
      PG.connect(dbname: "chitter_zimmja#{'_test' if ENV['ENVIRONMENT'] == 'test'}")
    end
  end
end
