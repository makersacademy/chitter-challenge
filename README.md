# Chitter Challenge

Chitter is a social networking service on which users post and interact with messages known as "peeps".
Peeps are restricted to 500 characters.

## MVC model

  

## Getting started

* Please clone the repository typing on your terminal: `git@github.com:l-palermo/chitter-challenge.git`
* Then run `bundle` to install dependecies
* This app uses a `PG` gem and an integrated `SQL` database using a `Object Relational Mapper` as the database interface

## How to use the software

* From the folder `Chitter-challenge` run `rackup config.ru` then move to the browser and in the URL line type `localhost:"#portnumber"`
* if show a message error `Address already in use` type `rackup config.ru -p 9393` where -p specifies the port number.

### Example of usage