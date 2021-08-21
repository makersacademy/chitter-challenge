#!/usr/bin/env ruby
require 'sinatra' 
require 'sinatra/reloader'
# require 'peep'
require './lib/db/connect.rb'
require './lib/db/create_tables.rb'

class Chitter < Sinatra::Base
  attr_reader :db_connection
  configure :development do
    register Sinatra::Reloader

    @db_connection = Connect.initiate(:chitter)
    CreateTables.if_not_exists(@db_connection)
  end

  configure :test do
    @db_connection = Connect.initiate(:chitter)
    CreateTables.if_not_exists(@db_connection)
  end

  enable :sessions

  get "/" do 
    erb :index
  end

  run! if app_file == $0

end
