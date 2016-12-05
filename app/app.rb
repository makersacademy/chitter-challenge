ENV["RACK_ENV"] ||= "development"
require "sinatra/base"
require "sinatra/partial"
require "./app/models/user"
require "./app/models/peep"
require "./app/models/comment"
require "./app/models/mailgun"
require_relative "datamapper_setup"
require 'sinatra/flash'
require "dotenv"
Dotenv.load
require_relative "controllers/users"
require_relative "controllers/sessions"
require_relative "controllers/peeps"
require_relative "controllers/comments"
require_relative "server"
require 'sinatra/partial'
