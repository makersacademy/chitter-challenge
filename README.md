#Chitter App#

Chitter is an app that will allow you, once logged in, to post messages ('peeps') to a communal wall.
Anyone who accesses this app will be able to read your peeps whether they are logged in or not.

To use in production, go to https://chitterbeth.herokuapp.com/

To open in development, ensure you have the following installed:

- ruby
- postgres

Then run the following from the command line:

```
$ git clone https://github.com/elizabethvenner/chitter-challenge.git
$ bundle
$ psql
$ create database chitter_development;
$ ^D
$ rake auto_migrate
$ rackup config.ru
```

Elizabeth Venner
