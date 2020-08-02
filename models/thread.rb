require_relative 'database_start_script'

class Threads

  attr_reader :id

  def initialize(id:)
    @id = id
  end

  def self.add
    DatabaseConnection.query("INSERT INTO threads")
  end

  def self.all
    DatabaseConnection.query("SELECT id from threads").map { |record| Threads.new(id: record['id'])}
  end

  def get_peeps
    DatabaseConnection.query("SELECT peeps.content FROM peeps WHERE peeps.id IN (SELECT user_peeps.peep_id FROM user_peeps WHERE user_peeps.thread_id = '#{@id}')")
        .map { |record| p record['content']}
  end

end


a = Threads.all
a.map { |thread| thread.get_peeps }