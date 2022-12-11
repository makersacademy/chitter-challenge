require_relative 'peep'

class PeepRepository
  def all
    peeps = []

    # Send the SQL query and get the result set.
    sql = 'SELECT id, 
                  content, 
                  post_time,
                  account_id
    FROM peeps;'
    result_set = DatabaseConnection.exec_params(sql, [])
    
    # The result set is an array of hashes.
    # Loop through it to create a model
    # object for each record hash.
    result_set.each do |record|
      peeps << record_info(record)
    end

    return peeps
  end

  def find_by_peep_id(id)
    sql = 'SELECT id, 
                  content, 
                  post_time,
                  account_id
    FROM peeps
    WHERE id = $1;'
    result_set = DatabaseConnection.exec_params(sql, [id])

    record = result_set[0]

    return record_info(record)
  end

  def find_by_account(account_id)
    sql = 'SELECT id, 
                  content, 
                  post_time,
                  account_id
    FROM peeps
    WHERE account_id = $1;'
    result_set = DatabaseConnection.exec_params(sql, [account_id])

    account_peeps = []
    
    result_set.each do |record|
      account_peeps << record_info(record)
    end

    return account_peeps
  end

  def create(peep)
    sql = 'INSERT INTO peeps (content, post_time, account_id) VALUES ($1, $2, $3);'
    result_set = DatabaseConnection.exec_params(sql, [peep.content, peep.post_time, peep.account_id])

    return peep
  end

  private

  def record_info(record)
    peep = Peep.new
    peep.id = record['id'].to_i
    peep.content = record['content']
    peep.post_time = record['post_time']
    peep.account_id = record['account_id']

    return peep
  end
end