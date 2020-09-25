### To dos
1. Set up DBs
  - chitter
    - PEEPS: id, text, USER(foreign key), time  <- check comments walkthrough
    - USERS: id, email, password, name, username
  - chitter_test
    - as above...

2. Write DB instructions

3. Check how to authenticate etc

4. Write gemfile, install gemfiles.

## Classes
#### User
require DB connection

- self.create(email, password, name, username)
- initizialize(email, password, name, username)

#### Peep
- Set environment (used in each method)
- Initialize 
- self.all (returns all peeps from DB)
- self.create (new peep into DB)

#### Connection to DB
require  'pg'
- self.setup(dbname)
- self.connection (just returns @connection)
- self.query(sql)

## Sinatra views
#### Home page
- Sign up link at top

- New peep - FORM. 
  - Error if not logged in

- Shows peeps in reverse chronological order
  - Text, user, time
- Log in link at top

#### Sign up page
- Form: email, password, name, username
- Submit button 
- Redirects to main page with confirmation of sign up(flash)

