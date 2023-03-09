require 'peeps'

class PeepsRepository

  # Selecting all records
  # No arguments
  def all
    peeps = []
    sql = 'SELECT id, message, time_of_post, user_id FROM peeps;'
    result_set = DatabaseConnection.exec_params(sql, [])

    result_set.each do |record|
      peep = Peeps.new

      peep.id = record['id']
      peep.message = record['message']
      peep.time_of_post = record['time_of_post']
      peep.user_id = record['user_id']

      peeps << peep
    end
        # Returns an array of Peep objects.
    return peeps
  end
end

