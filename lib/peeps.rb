class Peep
    attr_reader :user_id, :status, :id
    require 'pg'

    def initialize(user_id, status, id)
       
        @user_id = user_id
        @status = status
        @id = id

    end

    def self.all_peep

        @peeps = []

        rs = self.check_env.exec "SELECT * FROM chitter_table"

    rs.map do |row|
      
      @peeps << Peep.new(row['user_id'], row['peep'], row['id'])
    end
        return @peeps
    end

    def self.post_peep(user_login, status)

        self.check_env.exec "INSERT INTO chitter_table (user_id, peep) VALUES ('#{user_login}', '#{status}');"
    end

    private
    def self.check_env
      if ENV['ENVIRONMENT'] == 'test'
        PG.connect :dbname => 'chitter_test'
      else
        PG.connect :dbname => 'chitter'
      end
    end

end