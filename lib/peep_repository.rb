require 'peep'

class PeepRepository
    def all
        peeps = []
        sql = 'SELECT * FROM peeps;'
        result_set = DatabaseConnection.exec_params(sql, [])

        result_set.each do |record|
            peep = Peep.new
            peep.id = record['id']
            peep.time_posted = record['time_posted']
            peep.content = record['content']
            peep.user_id = record['user_id']
            peeps << peep
        end
        return peeps
    end

    def find(id)
        sql = 'SELECT * FROM peeps WHERE id = $1'
        result_set = DatabaseConnection.exec_params(sql, [id])
        record = result_set.first
        peep = Peep.new
        peep.id = record['id']
        peep.time_posted = record['time_posted']
        peep.content = record['content']
        peep.user_id = record['user_id']
        return peep
    end

    def create(peep)
        sql = 'INSERT INTO peeps (time_posted, content, user_id) VALUES ($1, $2, $3);'
        params = [peep.time_posted, peep.content, peep.user_id]
        DatabaseConnection.exec_params(sql, params)
        return nil
    end
end