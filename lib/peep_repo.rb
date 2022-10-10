require 'peep'

class PeepRepository
    def initialize

    end

    def all
        peeps = []
        sql = 'SELECT id, content, date_time, user_id FROM peeps;'
        result_set = DatabaseConnection.exec_params(sql, [])

        result_set.each do |record|
            peep = Peep.new
            peep.id = record['id']
            peep.content = record['content']
            peep.date_time = record['date_time']
            peep.user_id = record['user_id']
            peeps << peep
        end

        return peeps
    end

    def create(peep)
        sql = 'INSERT INTO peeps (content, date_time, user_id) VALUES ($1, $2, $3);'
        result_set = DatabaseConnection.exec_params(sql, [peep.content, peep.date_time, peep.user_id])
        # Could have it return the user if I wanted to say user created
    end

end
