class PeepRepository
  def initialize(time = Time)
    @time = time
  end

  def create(peep)
    fail "invalid peep submitted" if invalid_peep?(peep)
    sql = 'INSERT INTO peeps (content, timestamp, name, username)
      VALUES ($1, $2, $3, $4);'
    params = [peep[:content], @time.now, peep[:name], peep[:username]]
    DatabaseConnection.exec_params(sql, params)
  end

  def view_all
    sql = 'SELECT * FROM peeps;'
    DatabaseConnection.exec_params(sql, [])
  end

  private

  def invalid_peep?(peep)
    check = [:content, :name, :username]
    return true unless peep.keys.sort == check.sort
    return true if peep.values.any? { |v| v.nil? || v.empty? }
    false
  end
end
