# Chitter Challenge

## Requirements
_______________________

```ruby
gem 'activerecord'          # Models
gem 'bcrypt'                # User password encryption
gem 'pg'                
gem 'rake'
gem 'sinatra'               
gem 'sinatra-activerecord'
gem 'sinatra-flash'         # Flash alerts
gem 'time_diff'             # pretty time calculation
gem 'warden'                # Authentication middleware
```

## Installation
____________________________

Clone repo, create databases with Activerecord:

```ruby
rake db:create
rake db:migrate
```
`Rackup` and then you're good to go!

## Usage
_______________

Frome the home page, users can choose to log in or sign up:
<div>
  <a href="url"><img src="https://i.imgur.com/Ln1MVkt.png" height="400"></a>
</div>
  
Users sign up with a Name, Email, Handle and Password:
<div>
  <a href="url"><img src="https://i.imgur.com/L5f34M1.png" height="400"></a>
</div>
  
or log in with an email and password:
<div>
  <a href="url"><img src="https://i.imgur.com/mJHM7Y6.png" height="400"></a>
</div>

once logged in users can post peeps, see existing peeps in reverse chronological order and reply to existing peeps:
<div>
  <a href="url"><img src="https://i.imgur.com/dZMYsON.png" height="400"></a>
</div>

If a user is tagged with their @handle, an alert will appear next to the Tags button.
<div>
  <a href="url"><img src="https://i.imgur.com/LPqYsuK.png" height="200"></a>
</div>

when clicked , all unread tags are set to read, so on next viewing they well be inder the Read column
<div>
  <a href="url"><img src="https://i.imgur.com/lK8btHI.png" height="400"></a>
</div>

When finished with Chitter, users can log out wiht the log out button.
