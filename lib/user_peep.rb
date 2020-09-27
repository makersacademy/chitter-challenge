require_relative 'database_connection'


class UserPeep
    def self.add(user_id, peep_id)
        result = DatabaseConnection.query( "INSERT INTO user_peep(user_id, peep_id ) VALUES('#{user_id}','#{peep_id}')  RETURNING user_id, peep_id")
        UserPeep.new(result[0]['user_id'], result[0]['peep_id']
    end
end