class Peep

    def self.create(message:, user_id:)
        if message != ""
            string = "#{message}"
            peep = DatabaseConnection.query("INSERT INTO peeps (message, tdz, user_id) VALUES ('#{string}', '#{Time.now}', #{user_id}) RETURNING *;").first
            user_name = Peep.get_user_name(user_id: peep['user_id'])
            Peep.new(id:peep['id'], message:peep['message'], tdz:peep['tdz'], user_name: user_name)
        end
    end

    def self.all_in_order
        peeps = DatabaseConnection.query("SELECT * FROM peeps ORDER BY tdz DESC;")
        peeps.map do |peep|
            user_name = Peep.get_user_name(user_id: peep['user_id'])
            Peep.new(id:peep['id'], message:peep['message'], tdz:peep['tdz'], user_name: user_name)
        end
    end

    attr_reader :id, :message, :tdz, :user_name

    def initialize(id:, message:, tdz:, user_name:)
        @id = id
        @message = message
        @tdz = tdz
        @user_name = user_name
    end

    private
    def self.get_user_name(user_id:)
        DatabaseConnection.query("SELECT user_name FROM users WHERE id = #{user_id};").first['user_name']
    end

end