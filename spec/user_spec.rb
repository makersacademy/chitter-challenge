require 'user'
require 'pg'

describe User do
    it 'Get a user' do 
        connection = PG.connect(dbname: 'chitter_test')
        email = 'rob@rob.com'
        password = 'rob'

        # connection.exec("INSERT INTO users (email, password) VALUES ($1, crypt($2, gen_salt('bf')));", [email, password])

        User.create(email, password)

        user = User.find(email, password)

        expect(user.first.email).to eq 'rob@rob.com'
    end
end