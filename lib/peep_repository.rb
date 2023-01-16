require_relative './peep'

class PeepRepository
    def all
        peeps = []
        sql = 'SELECT id, time_posted, content, user_id FROM peeps;'
        result_set = DatabaseConnection.exec_params(sql, [])

        result_set.each do |record|
            peep = Peep.new
            peep.id = record['id'].to_i
            peep.time_posted = DateTime.parse record['time_posted']
            peep.content = record['content']
            peep.user_id = record['user_id'].to_i
            peeps << peep
        end

        return peeps
    end

    def find(id)
        sql = 'SELECT time_posted, content, user_id FROM peeps WHERE id = $1;'
        result_set = DatabaseConnection.exec_params(sql, [id])
        record = result_set.first
        peep = Peep.new
        peep.time_posted = DateTime.parse record['time_posted']
        peep.content = record['content']
        peep.user_id = record['user_id'].to_i
        return peep
    end

    def create(peep)
        sql = 'INSERT INTO peeps (time_posted, content, user_id) VALUES ($1, $2, $3);'
        params = [peep.time_posted, peep.content, peep.user_id]
        DatabaseConnection.exec_params(sql, params)
        return nil
    end
end