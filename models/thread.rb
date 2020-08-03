require_relative 'database_start_script'
require_relative './peep'

class ParentThread

  attr_reader :id, :owner

  def initialize(published:, id:)
    @id = id
    @published = DateTime.parse(published).strftime("%k:%M:%S %d-%m-%Y")
    # @owner = poster
  end

  def self.add
    record = DatabaseConnection.query("INSERT INTO threads values(DEFAULT, DEFAULT) RETURNING *")[0]
    ParentThread.new(id: record['id'], published: record['published'])
  end

  def self.all
    DatabaseConnection.query("SELECT id, published from threads ORDER BY published DESC").map { |record| ParentThread.new(published: record['published'], id: record['id'])}
  end

  def get_peeps(id)
    DatabaseConnection.query("SELECT * FROM peeps WHERE peeps.id IN (SELECT user_peeps.peep_id FROM user_peeps WHERE user_peeps.thread_id = '#{id}') ORDER BY published DESC")
          .map { |record| Peep.new(id: record['id'], content: record['content'], published: record['published'], edited: record['edited']) }
  end

  # TODO: Complete Poster. Add new column to thread.
  #def poster
  #  DatabaseConnection.query("SELECT name FROM users WHERE users.id IN (SELECT user_peeps.thread_id FROM user_peeps WHERE thread_id = '#{@id}')").first # if fails, use published!
  # end

end