require './app/models/user'
require './app/models/peep'

encrypted_alice = BCrypt::Password.create('password123')
encrypted_bob = BCrypt::Password.create('password321')
encrypted_nopeeps = BCrypt::Password.create('password999')

User.create(username: 'al123', forename: 'Alice', surname: 'Smith', email: 'alice.smith@gmail.com', password: encrypted_alice)
User.create(username: 'bo123', forename: 'Bob', surname: 'Smith', email: 'bob.smith@gmail.com', password: encrypted_bob)
User.create(username: 'nopeeps', forename: 'No', surname: 'Peeps', email: 'no.peeps@gmail.com', password: encrypted_nopeeps)
Peep.create(message: 'The first peep in the test database', user_id: 1)
Peep.create(message: 'The second peep in the test database', user_id: 2)
Peep.create(message: 'The third peep in the test database', user_id: 1)
Peep.create(message: 'The fourth peep in the test database', user_id: 1)
Peep.create(message: 'The fifth peep in the test database', user_id: 2)
Peep.create(message: 'The sixth peep in the test database', user_id: 2)
