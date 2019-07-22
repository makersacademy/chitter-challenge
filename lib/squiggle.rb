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

  def self.sanitise(string)
    raise "NICE TRY now go away" if string.match('DROP TABLE')
    raise "NICE TRY now go away" if string.match('DROP DATABASE')
    raise "NICE TRY now go away" if string.match('TRUNCATE')
    string.gsub("\'","\'\'")
  end

  # def find_nuttags
  #   @squiggle.split.select { |word| word.start_with?('#')}
  # end

  def self.create(user_id:,squiggle:)
    time = Time.now
    result = DatabaseConnection.query("INSERT INTO squiggles (user_id, squiggle, time) VALUES('#{user_id}', '#{squiggle}', '#{time}') RETURNING id, user_id, squiggle, time")
    Squiggle.new(result[0]['id'], result[0]['user_id'], result[0]['squiggle'], result[0]['time'])
  end

  def self.find(id)
    result = DatabaseConnection.query("SELECT * FROM squiggles WHERE id = #{id}")
    result.map { |squiggle| Squiggle.new(squiggle['id'], squiggle['user_id'], squiggle['squiggle'], squiggle['time']) }.first
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

  def tags
    result = DatabaseConnection.query("SELECT nuttags.id, tag FROM squiggles_tags INNER JOIN nuttags ON nuttags.id = squiggles_tags.nuttag_id WHERE squiggles_tags.squiggle_id = #{@id};")
    result.map { |tag| Tag.new(tag['id'], tag['tag']) }
  end

end
#
# s = Squiggle.new(1,2,"blah blah #cool #radical", Time.now)
# p s.find_nuttags
