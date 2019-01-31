require './app/models/user'
require './app/models/peep'

User.create(id: 1, username: 'al123', forename: 'Alice', surname: 'Smith', email: 'alice.smith@gmail.com', password: 'password123')
User.create(id: 2, username: 'bo123', forename: 'Bob', surname: 'Smith', email: 'bob.smith@gmail.com', password: 'password321')
Peep.create(id: 1, message: 'The first peep in the test database', user: 1)
Peep.create(id: 2, message: 'The second peep in the test database', user: 1)
Peep.create(id: 3, message: 'The third peep in the test database', user: 1)
Peep.create(id: 4, message: 'The fourth peep in the test database', user: 1)
Peep.create(id: 5, message: 'The fifth peep in the test database', user: 1)
Peep.create(id: 6, message: 'The sixth peep in the test database', user: 1)
