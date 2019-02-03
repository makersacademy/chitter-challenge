require 'pg'
require_relative 'database_helpers'
require_relative 'database_connection'
require 'date'

class Peep

  def self.all
    select_connection
    result = DBConn.query('SELECT * FROM peeps ORDER BY date_posted desc')
    result.map do |peep|
      Peep.new(id: peep['id'], comment: peep['comment'], date_posted: peep['date_posted'])
    end
  end

  def self.create(comment:, date_posted:)
    select_connection
    result = DBConn.query("INSERT INTO peeps (comment, date_posted) VALUES ('#{comment}', CURRENT_TIMESTAMP) RETURNING id, comment, date_posted;")
    Peep.new(id: result[0]['id'], comment: result[0]['comment'], date_posted: result[0]['date_posted'])
  end

  def self.delete(id:)
    select_connection
    DBConn.query("DELETE from peeps where id =('#{id}')")
  end

  def self.update(id:, comment:)
    select_connection
    result = DBConn.query("UPDATE peeps SET comment = '#{comment}' WHERE id = '#{id}' RETURNING id, comment;")
    Peep.new(id: result[0]['id'], comment: result[0]['comment'], date_posted: result[0]['date_posted'])
  end

  def self.find(id:)
    select_connection
    result = DBConn.query("SELECT * FROM peeps WHERE id = #{id}")
    Peep.new(id: result[0]['id'], comment: result[0]['comment'], date_posted: result[0]['date_posted'])
  end

  attr_reader :comment, :id, :date_posted

  def initialize(id:, comment:, date_posted:)
    @id = id
    @comment = comment
    @date_posted = date_posted
  end
end
