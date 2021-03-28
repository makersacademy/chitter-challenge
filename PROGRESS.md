Setup-

Got stuck on the setp up, had to order my requires in this way:

ENV['ENVIRONMENT'] = 'test'
ENV['RACK_ENV'] = 'test'

require File.join(File.dirname(__FILE__), '..', 'app.rb')

require 'simplecov'
require 'simplecov-console'
require 'capybara'
require 'capybara/rspec'
require 'rspec'
require 'pg'

I also jumped the gun and created a chitter web app class which created a superclass mismatch TypeError

---------------

*As a Maker*
*So that I can let people know what I am doing*
*I want to post a message (peep) to chitter*

