# Chitter app

## App description

* Sinatra, Rack, and Postgresql web app allows viewing of 'peeps' posted by users.

* User passwords are encrypted using bcrypt.

* A registered user can log in and post 'peeps'.

* An unregistered user can sign up.

## Testing

* Tested using Rspec with simplecov, and rubocop

Run the following commands to enable testing:

```bash
bundle add rspec
rspec --init
bundle add bcrypt
```