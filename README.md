# Chitter

A basic twitter clone. Created models 'user' & 'peep' to enable user to log in and post a peep. Peeps are displayed in reverse cronological order and can be viewed by their content, date_time & the user who posted them. Users can log in to publish a peep and log out to avoid their flatmate posting on behalf of them and getting into all sorts of trouble. 

# Technologies
- Ruby using the Sinatra Framework
- HTML/CSS
- PostgreSQL

## User Stories

``` 
Post a message (peep) to chitter

See all peeps in reverse chronological order

See the time at which a peep was made

Sign up for Chitter so I can post peeps

Log in to Chitter and post peeps myself

Log out of Chitter and avoid posting peeps
```

## Models

'@' = Instance Variables\
'#' = Instance Methods\
'.' = Class Methods

### User

| attributes| methods             |
| ---       | ---                 |
| @id       | #initialize         |
| @name     | .create             |
| @email    | .authenticate       |
| @password | .instance (private) |

### Peep

| attributes | methods             |
| ---        | ---                 |
| @id        | #initialize         |
| @user_id   | #user               |
| @date_time | .create             |
| @message   | .all                |
|            | .instance (private) |
