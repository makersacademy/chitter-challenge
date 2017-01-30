Chitter Challenge

A bootstrapped version of the popular social media website Twitter.

Prerequisites

Postgres
Instructions

Clone the repository from github and then cd into the cloned directory.

$ git clone git@github.com:mannieg/chitter-challenge.git
$ cd chitter-challenge
Load dependencies with bundle.

$ gem install bundle
$ bundle
Create the following databases in Postgres.

$ psql
$ CREATE DATABASE chitter_development
Launch web server.

$ rackup -p 4567
