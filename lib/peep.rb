require_relative 'database_connection'
require_relative "./comment"
require 'date'
require_relative './tag'

class Peep

  attr_reader :id, :peep, :user_id, :created_at

  def initialize(id:, peep:, user_id:, created_at:)
    @id = id
    @peep = peep
    @user_id = findname(user_id)
    @created_at = timezone_convert(created_at)
  end

  def time
    @created_at.strftime('%H:%M')
  end

  def date
    @created_at.strftime('%-d/%-m/%Y')
  end

  def self.all
    peeps = DatabaseConnection.query("SELECT * FROM peeps;")
    peeps.map { |peep| 
      Peep.new(
        id: peep['id'],
        peep: peep['peep'], 
        created_at: peep['created_at'],
        user_id: peep['user_id'],
        ) }
  end

def self.create(peep:, user_id:)
  result = DatabaseConnection.query("INSERT INTO peeps (peep, user_id) VALUES($1, $2) RETURNING id, peep, created_at, user_id;", [peep, user_id])
  Peep.new(
    id: result[0]['id'], 
    peep: result[0]['peep'], 
    created_at: result[0]['created_at'], 
    user_id: user_id)
end

  def self.delete(id:)
    result = DatabaseConnection.query("DELETE FROM peeps WHERE id = $1", [id])
  end

  def self.update(id:, peep:)
    result = DatabaseConnection.query("UPDATE peeps SET peep = $1 WHERE id = $2 RETURNING id, peep;",
    [peep, id])
    Peep.new(id: result[0]['id'], peep: result[0]['peep'])
  end

  def self.find(id:)
    result = DatabaseConnection.query("SELECT * FROM peeps WHERE id = $1;",
    [id]
  )
  Peep.new(id: result[0]['id'], peep: result[0]['peep'])
end

  def comments(comment_class = Comment)
    comment_class.where(peep_id: id)
  end

  def tags(tag_class = Tag)
    tag_class.where(peep_id: id)
  end

  private
    def findname(user_id)
      return 'Chitterer' unless user_id
      name = DatabaseConnection.query("SELECT username FROM chitter_users WHERE id=#{user_id}") 
      name[0]['username']
    end

    def timezone_convert(created_at)
      ENV['TZ'] = 'GB'
      original_time = DateTime.parse(created_at)
      dst_offset = Time.parse(original_time.new_offset('+01:00').to_s)
      offset = dst_offset.dst? ? "BST" : "UTC"
      original_time.new_offset(offset)
  end

end