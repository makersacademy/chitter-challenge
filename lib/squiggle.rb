require_relative '../database_connection_setup'
require 'date'

class Squiggle

  attr_reader :id, :user_id, :squiggle, :time

  def initialize(id, user_id, squiggle, time)
    @id = id
    @user_id = user_id
    @squiggle = squiggle
    @time = time
  end

  def nuttify
    @squiggle.gsub(/[aeiou]/,'🌰')
  end

  def self.create(user_id:,squiggle:)
    time = Time.now
    result = DatabaseConnection.query("INSERT INTO squiggles (user_id, squiggle, time) VALUES('#{user_id}', '#{squiggle}', '#{time}') RETURNING id, user_id, squiggle, time")
    Squiggle.new(result[0]['id'], result[0]['user_id'], result[0]['squiggle'], result[0]['time'])
  end

  def self.delete(id)
    DatabaseConnection.query("DELETE FROM squiggles WHERE id = #{id};")
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM squiggles")
    result.map do |squiggle|
      Squiggle.new(squiggle['id'], squiggle['user_id'], squiggle['squiggle'], squiggle['time'])
    end
  end

end
