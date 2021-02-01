class User
    def self.create(email:, password:)
        if ENV['ENVIRONMENT'] == 'test'
            connection = PG.connect(dbname: 'chitter_test')
        else
            connection = PG.connect(dbname: 'chitter')
        end
        result = connection.exec("INSERT INTO users (email, password) VALUES ('#{email}', '#{password}') RETURNING id, email;")
        User.new(id: result[0]['id'], email: result[0]['email'])
    end

    def self.find(id:)
        if ENV['ENVIRONMENT'] == 'test'
            connection = PG.connect(dbname: 'chitter_test')
        else
            connection = PG.connect(dbname: 'chitter')
        end
        p id
        p id.is_a? String
        p "SELECT * FROM users WHERE id = #{id};"
        result = connection.exec("SELECT * FROM users WHERE id = #{id};")
        # result = connection.exec("SELECT * FROM users WHERE id = 1;")
        User.new(id: result[0]['id'], email: result[0]['email'])
    end

    attr_reader :email, :id

    def initialize(id:, email:)
        @id = id
        @email = email
    end
end