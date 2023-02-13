require_relative 'peep'
require 'database_connection'

class PeepRepository

    def all
        peeps = []
        sql = 'SELECT id, contents, timestamp, user_id FROM peeps;'
        result_set = DatabaseConnection.exec_params(sql, [])

        result_set.each do |record|
            peep = Peep.new
            peep.id = record['id'].to_i
            peep.contents = record['contents']
            peep.timestamp = record['timestamp']
            peep.user_id = record['user_id'].to_i

            peeps << peep
        end

        # peeps_sorted = peeps.sort_by! { |k| k["timestamp"] }
        # return peeps_sorted
                #this should list them in reverse chronological order so this method can be called to the homepage
        return peeps
    end


    def find(id)
        sql = 'SELECT id, contents, timestamp, user_id FROM peeps WHERE id = $1;'
        result_set = DatabaseConnection.exec_params(sql, [id])

        peep = Peep.new
        peep.id = result_set[0]['id'].to_i
        peep.contents = result_set[0]['contents']
        peep.timestamp = result_set[0]['timestamp']
        peep.user_id = result_set[0]['user_id'].to_i
    return peep
end

def create(peep)
  sql = 'INSERT INTO peeps (contents, timestamp, user_id) VALUES ($1, $2, $3);'
  result_set = DatabaseConnection.exec_params(sql, [peep.contents, peep.timestamp, peep.user_id])

  return peep
end

end