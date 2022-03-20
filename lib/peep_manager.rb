require_relative './database_manager'
require_relative './peep'

class PeepManager
  NO_PEEPS_MESSAGE = 'No peeps, yet...'.freeze

  def peep_count
    @peeps.length
  end

  def add(new_peep)
    content = new_peep
    sql_query = "INSERT INTO peeps (content) VALUES ($1)"
    @db_manager.query(sql_query, content)
  end

  def all_peeps
    reset_peeps_array
    peeps_from_database
    peep_count.zero? ? error_peep : @peeps
  end

  def peeps_from_database
    sql_query = "SELECT * FROM peeps ORDER BY created DESC"
    @db_manager.query(sql_query).each do |row|
      @peeps << create_peep(row)
    end
  end

  def self.instance
    @manager ||= PeepManager.new
  end

  private

  def error_peep
    [Peep.new(nil, NO_PEEPS_MESSAGE, nil, nil)]
  end

  def reset_peeps_array
    @peeps = []
  end

  def create_peep(row)
    Peep.new(row['id'], row['content'], row['maker_id'], row['created'])
  end

  def initialize(db_manager = DatabaseManager)
    @db_manager = db_manager
    # @peep_template = peep_template
    reset_peeps_array
  end
end
