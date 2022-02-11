# frozen_string_literal: true

class Peep
  def self.create_peep(peep, user_email)
    timestamp = DateTime.now

    DatabaseConnection.query(
      'INSERT INTO peeps(peep, user_email, time)
       VALUES($1, $2, $3);',
       [peep, user_email, timestamp]
     )
  end

  def self.populate_peeps
    result = DatabaseConnection.query(
      'SELECT * FROM peeps;'
    )
    @peeps = result.map do |peep|
      Peep.new(peep['peep'], peep['user_email'], peep['time'])
    end
  end

  def self.all_in_time_order
    (@peeps || populate_peeps).sort_by { |peep| peep.time }.reverse
  end

  attr_reader :peep, :user_email, :time

  def initialize(peep, user_email, time)
    @peep = peep
    @user_email = user_email
    @time = time
  end

  def timestamp
    DateTime.parse(@time).strftime('%c')
  end
end
