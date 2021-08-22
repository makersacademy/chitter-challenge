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
  end

  configure :test, :development do
    @db_connection = Connect.initiate(:chitter)
    CreateTables.if_not_exists(@db_connection)
  end

  enable :sessions

  get '/' do 
    erb :index
  end

  get '/signin' do
    erb :signin
  end

  get '/create' do
    erb :create
  end

  get '/peep' do
    erb :peep
  end

  run! if app_file == $0

end
