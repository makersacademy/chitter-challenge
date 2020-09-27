require_relative 'database_connection'
require_relative 'PeepInfo'

class UserPeep

    attr_reader :user_id, :peep_id

    def initialize(user_id, peep_id)
        @user_id = user_id
        @peep_id = peep_id
    end

    def self.add(user_id, peep_id)
        result = DatabaseConnection.query( "INSERT INTO user_peep(user_id, peep_id ) VALUES('#{user_id}','#{peep_id}')  RETURNING user_id, peep_id")
        UserPeep.new(result[0]['user_id'], result[0]['peep_id'])
    end

    def self.show

        result = DatabaseConnection.query("SELECT u.username, p.content, to_char(p.datetime, 'DD Mon YYYY HH24:MI:SS') AS \"datetime\" 
        FROM user_peep up, peep p, user_list u WHERE up.user_id = u.id AND up.peep_id = p.id ;")
        result.map {|info| PeepInfo.new(info['username'], info['content'], info['datetime'])}
    end
end