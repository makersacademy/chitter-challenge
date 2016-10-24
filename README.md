#Chitter App#

Chitter is an app that will allow you, once logged in, to post messages ('peeps' to a communal wall.
Anyone who accesses this app will be able to read your peeps whether they ar logged in or not.

```
$ git clone https://github.com/elizabethvenner/chitter-challenge.git
$ bundle
$ psql
$ create database chitter_development;
$ ^D
$ rake auto_migrate
$ rackup config.ru
```
