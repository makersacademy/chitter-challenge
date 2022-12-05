require_relative "database_connection"
require_relative "peep"

class PeepRepository
  def initialize(timer = Time)
    @timer = timer
  end

  def all
    sql_query = "SELECT id, contents, time_posted, account_id FROM peeps ORDER BY time_posted DESC;"
    query_result = DatabaseConnection.exec_params(sql_query, [])

    peeps = []
    query_result.each do |record|
      peeps << extract_peep_from_record(record)
    end
    return peeps
  end

  def find(id)
    sql_query = "SELECT id, contents, time_posted, account_id FROM peeps WHERE id = $1;"
    query_result = DatabaseConnection.exec_params(sql_query,[id])

    if query_result.first.nil?
      fail IndexError.new "There is no peep with ID #{id}"
    end
    return extract_peep_from_record(query_result.first)
  end

  def create(peep)
    fail ArgumentError.new "A peep cannot have empty contents" if peep.contents.empty?

    sql_query = "INSERT INTO peeps (contents, time_posted, account_id) VALUES ($1, $2, $3);"
    
    time_posted = peep.time_posted.nil? ? @timer.now : peep.time_posted
    params = [peep.contents, time_posted, peep.account_id]
    
    DatabaseConnection.exec_params(sql_query, params)
    return nil
  end

  private

  def extract_peep_from_record(record)
    peep = Peep.new
    peep.id = record["id"].to_i
    peep.contents = record["contents"]
    peep.time_posted = record["time_posted"]
    peep.account_id = record["account_id"].to_i
    return peep
  end
end
