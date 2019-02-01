require './app/models/user'
require './app/models/peep'

User.create(username: 'al123', forename: 'Alice', surname: 'Smith', email: 'alice.smith@gmail.com', password: 'password123')
User.create(username: 'bo123', forename: 'Bob', surname: 'Smith', email: 'bob.smith@gmail.com', password: 'password321')
Peep.create(message: 'The first peep in the test database', user: 1)
Peep.create(message: 'The second peep in the test database', user: 1)
Peep.create(message: 'The third peep in the test database', user: 1)
Peep.create(message: 'The fourth peep in the test database', user: 1)
Peep.create(message: 'The fifth peep in the test database', user: 1)
Peep.create(message: 'The sixth peep in the test database', user: 1)
