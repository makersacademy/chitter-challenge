class PeepRepository
  def initialize(time = Time)
    @time = time
  end

  def create(peep)
    fail "invalid peep submitted" if invalid_peep?(peep)
    sql = 'INSERT INTO peeps (content, timestamp, name, username)
      VALUES ($1, $2, $3, $4);'
    params = [
      peep[:content],
      @time.now,
      peep[:name],
      peep[:username]
    ]
    DatabaseConnection.exec_params(sql, params)
  end

  def view_all
    sql = 'SELECT * FROM peeps;'
    DatabaseConnection.exec_params(sql, [])
  end

  private

  def invalid_peep?(peep)
    return true if peep.keys.length != 3

    key_list = [:content, :name, :username]
    key_list.each do |item|
      return true unless peep.keys.include?(item)
    end
    
    peep.each_key do |key|
      return true if peep[key].nil?
      return true if peep[key].empty?
    end

    false
  end
end
