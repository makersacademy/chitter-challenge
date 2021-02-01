require 'PG'
# require 'Time'
require_relative 'db_connection'

class Peep
  attr_reader :content, :id, :posted_time_stamp

  def initialize(id, content, posted_time_stamp)
    @id = id
    @content = content
    @posted_time_stamp = posted_time_stamp
  end

  def self.new_peep(content, time_stamp)
    results = DBConnection.insert(table: 'peep', columns: ['content', 'posted'], values: [content, time_stamp]).first
    Peep.new(results['id'].to_i, results['content'], Time.parse(results['posted']))
  end

  def self.all
    results = DBConnection.query('select * from peep')
    results.map { |row| Peep.new(row['id'].to_i, row['content'], Time.parse(row['posted'])) }
  end

end
