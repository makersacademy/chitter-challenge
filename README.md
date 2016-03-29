# Chitter

Chitter is a basic emulation of a Twitter-like social media network. To see it working you can either join my hosted network at:

  https://secure-dawn-10517.herokuapp.com/

Or you can set up your own Chitter network by following these steps:

1) To install required gems, run

  $ bundle

2) To initialize a database with PSQL run:

```
  $ psql

  $ brew install postgresql

  $ ln -sfv /usr/local/opt/postgresql/*.plist ~/Library/LaunchAgents

  $ launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist

  $ CREATE DATABASE chitter_test;

  $ CREATE DATABASE chitter_development;
```

3) To set up your local databases, run:

  $ rake db:migrate RACK_ENV=test

  $ rake db:migrate RACK_ENV=development

4) Then to check everything is working run

  $ rspec

5) To launch your network, from the command-line run

  $ rackup

  and visit localhost://9292 in your browser.

That's it, enjoy peeping.
