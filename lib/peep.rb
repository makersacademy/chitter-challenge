class Peep

    def self.create(message:)
        if message != ""
            peep = DatabaseConnection.query("INSERT INTO peeps (message, tdz) VALUES ('#{message}', '#{Time.now}') RETURNING *;").first
            Peep.new(id:peep['id'], message:peep['message'], tdz:peep['tdz'])
        end
    end

    def self.all_in_order
        peeps = DatabaseConnection.query("SELECT * FROM peeps ORDER BY tdz DESC")
        peeps.map do |peep|
            Peep.new(id:peep['id'], message:peep['message'], tdz:peep['tdz'])
        end
    end

    attr_reader :id, :message, :tdz

    def initialize(id:, message:, tdz:)
        @id = id
        @message = message
        @tdz = tdz
    end

end