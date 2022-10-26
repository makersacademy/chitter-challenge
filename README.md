# Chitter

## User Story

```
As a Maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter

As a maker
So that I can see what others are saying  
I want to see all peeps in reverse chronological order

As a Maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made

As a Maker
So that I can post messages on Chitter as me
I want to sign up for Chitter

HARDER

As a Maker
So that only I can post messages on Chitter as me
I want to log in to Chitter

As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter

ADVANCED

As a Maker
So that I can stay constantly tapped in to the shouty box of Chitter
I want to receive an email if I am tagged in a Peep
```

## Additional Specs

- You don't have to be logged in to see the peeps.
- Makers sign up to chitter with their email, password, name and a username (e.g. samm@makersacademy.com, password123, Sam Morgan, sjmog).
- The username and email are unique.
- Peeps (posts to chitter) have the name of the maker and their user handle.

## Design and Specs

- [Users-Peeps Database Design](./docs/users_peeps_table_design.md)
- [Users Model and Class Repository](./docs/users_repository.md)
- [Peeps Model and Class Repository](./docs/peeps_repository.md)
- [Utilities Class](./docs/utilities.md)

## Routes

```
# Page: list of peeps

## Request:
GET /
No parameters

## Response (200 OK)
HTML view with list of peeps
```

```
# Page: list of peeps

## Request:
GET /index
No parameters

## Response (200 OK)
HTML view with list of peeps
```

```
# Page: create a new peep

## Request:
GET /peeps/new
No parameters

## Response (200 OK)
- HTML view with list of peeps if logged in
- HTML login page if not logged in
```


```
# Page: see one peep

## Request
GET /peeps/:id
With parameter :id

## Response (200 OK)
HTML view with details of a single peep or thread of peeps if there are replies
```

```
# Page: reply to one peep

## Request
GET /peeps/:id/reply
With parameter :id

## Response (200 OK)
HTML view with form to post a reply to a specific peep
```

```
# Page: sign up for chitter

## Request
GET /signup
No parameters

## Response (200 OK)
HTML view with form to sign up for chitter
```

```
# Page: log in to chitter

## Request
GET /login
No parameters

## Response (200 OK)
HTML view with form to log in to chitter
```

```
# Page: user created

## Request
POST /signup
With parameters: email, name, username, password

## Response (200 OK)
HTML view with confirmation of account creation
```

```
# Page: successful login

## Request
POST /login
With parameters: email, password

## Response (200 OK)
HTML view with confirmation of login
```

```
# Page: unsuccessful login

## Request
POST /login
With parameters: email, password

## Response (200 OK)
HTML view with message of unsuccessful login
```

```
# Page: logout

## Request
GET /logout
No parameters

## Response (200 OK)
HTML view with of homepage
```

```
# Page: add a new peep

## Request
GET /peeps/new
No parameters

## Response (OK 200)
HTML view form to submit new entry
```

```
# Page: new peep added

## Request:
POST /peeps/new
with parameters:
  content="..."
  
## Response (OK 200)
HTML view of homepage with new peep at the top
```

```
# Page: new peep added

## Request:
POST /peeps/:id/reply
with parameters:
  content="..."
  id # automatically passed through the method
  
## Response (OK 200)
HTML view of the thread page of a peep with id = :id
```

## Dependencies

- `Sinatra` for the app to run
- `BCrypt` for handling password
- `pg` for database interaction
- `RSpec` for Unit Testing and Integration Testing
- `SimpleCov` for test coverage

## Usage

The app support `production` and `development` databases. The databases name have been set up in `database_connection.rb` with default names: `chitter_development`, `chitter_production`.

The `app.rb` offers a way to switch databases using the environment variable `ENV['ENV']` on `line 9`.

### Steps
#### Create a postgresql databases
```
createdb chitter_development
createdb chitter_production
```
#### Set up the tables
```
psql -h <ip_address> chitter_development < chitter.sql
psql -h <ip_address> chitter_production < chitter.sql
```
#### Clone this repository
```
git clone <repo_url>
```

#### Install dependencies
```
cd chitter-project
bundle install
```

#### Launch the app
```
rackup
```
