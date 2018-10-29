# Chitter #

This is a Ruby twitter app using Sinatra and a Postgres database. Users can 'cheet' anonymously, or register and sign in/out. Cheets are stored in a postgres database, as are users.

'peep' and 'cheet' is used interchangably in this README!

## Setup ##

- Clone this repo
- Run ``` bundle ``` in the root folder
- Setup Postgres database using queries in db/migrations folder or download Table Plus to simplify your life.
- Setup test database using the same queries; name it chitter_database_test
- Run the server ``` rackup ```
- Open ``` localhost:9292 ```

### User Stories ###

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

As a Maker
So that only I can post messages on Chitter as me
I want to log in to Chitter

As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter
```

# Screenshots #

![Image of HomePage](/images/home_page.png)

![Image of Register](/images/register.png)

![Image of Profile](/images/profile_logged_in.png)
